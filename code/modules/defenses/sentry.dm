#define SENTRY_FIREANGLE 135
#define SENTRY_RANGE 8
#define SENTRY_ENGAGED_TIMEOUT 60 SECONDS
#define SENTRY_LOW_AMMO_TIMEOUT 20 SECONDS
#define SENTRY_LOW_AMMO_ALERT_PERCENTAGE 0.25

/obj/structure/machinery/defenses/sentry
	name = "\improper UA 571-C sentry gun"
	icon = 'icons/obj/structures/machinery/defenses/sentry.dmi'
	desc = "A deployable, semi-automated turret with AI targeting capabilities. Armed with an M30 Autocannon and a 500-round drum magazine."
	req_one_access = list(ACCESS_MARINE_ENGINEERING, ACCESS_MARINE_ENGPREP, ACCESS_MARINE_LEADER)
	var/list/targets = list() // Lists of current potential targets
	var/list/other_targets = list() //List of special target types to shoot at, if needed.
	var/atom/movable/target = null
	var/datum/shape/range_bounds
	var/datum/effect_system/spark_spread/spark_system //The spark system, used for generating... sparks?
	var/last_fired = 0
	var/fire_delay = 1

	var/burst_fire_delay = 0.1

	var/immobile = FALSE //Used for prebuilt ones.
	var/obj/item/ammo_magazine/ammo = new /obj/item/ammo_magazine/sentry

	/// Sound used when firing
	var/firing_sound = 'sound/weapons/gun_smartgun1.ogg'

	var/sentry_type = "uac_sentry" //Used for the icon
	display_additional_stats = TRUE
	/// Light strength when turned on
	var/luminosity_strength = 5
	/// Check if they have been upgraded or not, used for sentry post
	var/upgraded = FALSE
	var/omni_directional = FALSE
	var/additional_rounds_stored = FALSE
	var/sentry_range = SENTRY_RANGE

	has_camera = TRUE

	var/damage_mult = 1
	var/accuracy_mult = 0.5
	var/burst = 2
	handheld_type = /obj/item/defenses/handheld/sentry

	/// timer triggered when sentry gun shoots at a target to not spam the laptop
	var/engaged_timer = null
	/// timer triggered when sentry gun is low on ammo to not spam the laptop
	var/low_ammo_timer = null
	/// timer triggered when sentry gun is out of ammo to not spam the laptop
	var/sent_empty_ammo = FALSE

	/// action list is configurable for all subtypes, this is just an example
	choice_categories = list(
		// SENTRY_CATEGORY_ROF = list(ROF_SINGLE, ROF_BURST, ROF_FULL_AUTO),
		SENTRY_CATEGORY_IFF = list(FACTION_MARINE, SENTRY_FACTION_WEYLAND, SENTRY_FACTION_HUMAN, FACTION_UPP),
	)

	selected_categories = list(
		// SENTRY_CATEGORY_ROF = ROF_SINGLE,
		SENTRY_CATEGORY_IFF = FACTION_MARINE,
	)

	can_be_near_defense = TRUE

	var/start_up_message = "Default systems initiated."

	///Effect for the muzzle flash of the gun.
	var/atom/movable/vis_obj/effect/muzzle_flash/muzzle_flash
	///Icon state of the muzzle flash effect.
	var/muzzleflash_iconstate
	///Brightness of the muzzle flash effect.
	var/muzzle_flash_lum = 3
	///Color of the muzzle flash effect.
	var/muzzle_flash_color = COLOR_VERY_SOFT_YELLOW

	/// Delay sending no ammo messages
	COOLDOWN_DECLARE(no_ammo_message_cooldown)

	/// Delay for the beep before firing after not firing for a while
	COOLDOWN_DECLARE(beep_fire_sound_cooldown)

/obj/structure/machinery/defenses/sentry/Initialize()
	. = ..()
	spark_system = new /datum/effect_system/spark_spread
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)
	muzzle_flash = new(src, muzzleflash_iconstate)

	if(turned_on)
		start_processing()
		set_range()
	update_icon()
	RegisterSignal(src, COMSIG_ATOM_TURF_CHANGE, PROC_REF(unset_range))

/obj/structure/machinery/defenses/sentry/Destroy() //Clear these for safety's sake.
	targets = null
	other_targets = null
	target = null
	QDEL_NULL(range_bounds)
	QDEL_NULL(spark_system)
	QDEL_NULL(ammo)
	QDEL_NULL(muzzle_flash)
	stop_processing()
	. = ..()

/obj/structure/machinery/defenses/sentry/process()
	if(!turned_on)
		stop_processing()
		return

	if(!range_bounds)
		set_range()
	targets = SSquadtree.players_in_range(range_bounds, z, QTREE_SCAN_MOBS | QTREE_EXCLUDE_OBSERVER)
	if(!targets)
		return FALSE

	if(!target && length(targets))
		target = pick(targets)

	get_target(target)
	return TRUE

/obj/structure/machinery/defenses/sentry/proc/set_range()
	if(omni_directional)
		range_bounds = SQUARE(x, y, 8)
		return
	switch(dir)
		if(EAST)
			range_bounds = SQUARE(x + 4, y, 7)
		if(WEST)
			range_bounds = SQUARE(x - 4, y, 7)
		if(NORTH)
			range_bounds = SQUARE(x, y + 4, 7)
		if(SOUTH)
			range_bounds = SQUARE(x, y - 4, 7)

/obj/structure/machinery/defenses/sentry/proc/unset_range()
	SIGNAL_HANDLER
	if(range_bounds)
		QDEL_NULL(range_bounds)

/obj/structure/machinery/defenses/sentry/update_icon()
	..()

	overlays.Cut()
	if(stat == DEFENSE_DAMAGED)
		overlays += "[defense_type] [sentry_type]_destroyed"
		return

	if(!ammo || ammo && !ammo.current_rounds)
		overlays += "[defense_type] [sentry_type]_noammo"
		return
	if(turned_on)
		overlays += "[defense_type] [sentry_type]_on"
	else
		overlays += "[defense_type] [sentry_type]"


/obj/structure/machinery/defenses/sentry/attack_hand_checks(mob/user)
	if(immobile)
		to_chat(user, SPAN_WARNING("[src]'s panel is completely locked, you can't do anything."))
		return FALSE

	return TRUE

/obj/structure/machinery/defenses/sentry/update_choice(mob/user, category, selection)
	. = ..()
	if(.)
		return
	if(category in selected_categories)
		selected_categories[category] = selection
		switch(category)
			if(SENTRY_CATEGORY_ROF)
				handle_rof(selection)
				return TRUE
	return FALSE

/**
 * Update the rate of fire in the sentry gun.
 * @param level: level of rate of fire, typically single, burst or full auto.
 */
/obj/structure/machinery/defenses/sentry/proc/handle_rof(level)
	switch(level)
		if(ROF_SINGLE)
			burst = 1
			accuracy_mult = 1
			fire_delay = 4
		if(ROF_BURST)
			burst = 3
			accuracy_mult = 0.6
			fire_delay = 12
		if(ROF_FULL_AUTO)
			burst = 1
			accuracy_mult = 0.5
			fire_delay = 0.5

/obj/structure/machinery/defenses/sentry/get_examine_text(mob/user)
	. = ..()
	if(ammo)
		. += SPAN_NOTICE("\The [src] has [ammo.current_rounds]/[ammo.max_rounds] round\s loaded.")
		if(additional_rounds_stored)
			. += SPAN_NOTICE("\The [src] has [ammo.max_inherent_rounds] round\s left in storage.")
		if(upgraded)
			. += SPAN_NOTICE("\The [src] has been reinforced with metal sheets.")
	else
		. += SPAN_NOTICE("\The [src] is empty and needs to be refilled with ammo.")
		if(additional_rounds_stored)
			. += SPAN_HELPFUL("Click \The [src] while it's turned off to reload.")

/obj/structure/machinery/defenses/sentry/power_on_action()
	target = null
	set_light(luminosity_strength)

	visible_message("[icon2html(src, viewers(src))] [SPAN_NOTICE("The [name] hums to life and emits several beeps.")]")
	visible_message("[icon2html(src, viewers(src))] [SPAN_NOTICE("The [name] buzzes in a monotone voice: '[start_up_message]'")]")
	start_processing()
	set_range()

/obj/structure/machinery/defenses/sentry/power_off_action()
	set_light(0)
	visible_message("[icon2html(src, viewers(src))] [SPAN_NOTICE("The [name] powers down and goes silent.")]")
	stop_processing()
	unset_range()

/obj/structure/machinery/defenses/sentry/attackby(obj/item/O, mob/user)
	if(QDELETED(O) || QDELETED(user))
		return

	//Securing/Unsecuring
	if(HAS_TRAIT(O, TRAIT_TOOL_WRENCH))
		if(immobile)
			to_chat(user, SPAN_WARNING("[src] is completely welded in place. You can't move it without damaging it."))
			return

	if(!..())
		return

	// Rotation
	if(HAS_TRAIT(O, TRAIT_TOOL_SCREWDRIVER))
		if(immobile)
			to_chat(user, SPAN_WARNING("[src] is completely welded in place. You can't move it without damaging it."))
			return

		if(turned_on)
			to_chat(user, SPAN_WARNING("[src] is currently active. The motors will prevent you from rotating it safely."))
			return

		playsound(loc, 'sound/items/Screwdriver.ogg', 25, 1)
		user.visible_message(SPAN_NOTICE("[user] rotates [src]."), SPAN_NOTICE("You rotate [src]."))
		setDir(turn(dir, -90))
		return

	if(istype(O, ammo))
		if(!skillcheck(user, SKILL_ENGINEER, SKILL_ENGINEER_TRAINED) || user.action_busy)
			return

		user.visible_message(SPAN_NOTICE("[user] begins swapping a new [O.name] into [src]."),
		SPAN_NOTICE("You begin swapping a new [O.name] into [src]."))
		if(!do_after(user, 70 * user.get_skill_duration_multiplier(SKILL_ENGINEER), INTERRUPT_ALL, BUSY_ICON_FRIENDLY, src))
			return

		playsound(loc, 'sound/weapons/unload.ogg', 25, 1)
		user.visible_message(SPAN_NOTICE("[user] swaps a new [O.name] into [src]."),
		SPAN_NOTICE("You swap a new [O.name] into [src]."))

		ammo.forceMove(loc)

		ammo = O
		user.drop_held_item(O)
		O.forceMove(src)

		sent_empty_ammo = FALSE
		update_icon()
		return

	if(O.force)
		update_health(O.force/2)
	return ..()

/obj/structure/machinery/defenses/sentry/destroyed_action()
	visible_message("[icon2html(src, viewers(src))] [SPAN_WARNING("The [name] starts spitting out sparks and smoke!")]")
	playsound(loc, 'sound/mecha/critdestrsyndi.ogg', 25, 1)
	for(var/i = 1 to 6)
		setDir(pick(NORTH, EAST, SOUTH, WEST))
		sleep(2)

	cell_explosion(loc, 10, 10, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("sentry explosion", owner_mob))
	if(!QDELETED(src))
		qdel(src)

/obj/structure/machinery/defenses/sentry/damaged_action(damage)
	if(prob(10))
		spark_system.start()
	..()


/obj/structure/machinery/defenses/sentry/proc/fire(atom/A)
	if(!(world.time-last_fired >= fire_delay) || !turned_on || !ammo || QDELETED(target))
		return

	if(COOLDOWN_FINISHED(src, beep_fire_sound_cooldown)) //if we haven't fired for a while, beep first
		playsound(loc, 'sound/machines/twobeep.ogg', 50, 1)

	if(ammo && ammo.current_rounds <= 0)
		if(COOLDOWN_FINISHED(src, no_ammo_message_cooldown))
			visible_message(SPAN_WARNING("[src] beeps steadily and its ammo light blinks red."))
			COOLDOWN_START(src, no_ammo_message_cooldown, (3 SECONDS))

		return

	last_fired = world.time
	COOLDOWN_START(src, beep_fire_sound_cooldown, (30 SECONDS))

	if(QDELETED(owner_mob))
		owner_mob = src

	if(omni_directional)
		setDir(get_dir(src, A))

	actual_fire(A, burst, FALSE)

	if(length(targets))
		addtimer(CALLBACK(src, PROC_REF(get_target)), fire_delay)

	if(!engaged_timer)
		SEND_SIGNAL(src, COMSIG_SENTRY_ENGAGED_ALERT, src)
		engaged_timer = addtimer(CALLBACK(src, PROC_REF(reset_engaged_timer)), SENTRY_ENGAGED_TIMEOUT)

	if(!low_ammo_timer && ammo?.current_rounds && (ammo?.current_rounds < (ammo?.max_rounds * SENTRY_LOW_AMMO_ALERT_PERCENTAGE)))
		SEND_SIGNAL(src, COMSIG_SENTRY_LOW_AMMO_ALERT, src)
		low_ammo_timer = addtimer(CALLBACK(src, PROC_REF(reset_low_ammo_timer)), SENTRY_LOW_AMMO_TIMEOUT)

/obj/structure/machinery/defenses/sentry/proc/reset_engaged_timer()
	engaged_timer = null

/obj/structure/machinery/defenses/sentry/proc/reset_low_ammo_timer()
	low_ammo_timer = null

/obj/structure/machinery/defenses/sentry/proc/actual_fire(atom/firing_target, projectiles_to_fire = 1, recursive)
	if(!firing_target || !(firing_target in targets))
		return

	var/obj/projectile/new_projectile = new(src, create_cause_data(initial(name), owner_mob, src))
	new_projectile.generate_bullet(new ammo.default_ammo)
	new_projectile.damage *= damage_mult
	new_projectile.accuracy *= accuracy_mult
	GIVE_BULLET_TRAIT(new_projectile, /datum/element/bullet_trait_iff, faction_group)

	new_projectile.fire_at(firing_target, src, owner_mob, new_projectile.ammo.max_range, new_projectile.ammo.shell_speed, null, FALSE)

	if(!recursive)
		muzzle_flash(Get_Angle(get_turf(src), firing_target))
		if(firing_sound)
			playsound(loc, firing_sound, 75, 1)

	ammo.current_rounds--
	track_shot()

	if(ammo.current_rounds == 0)
		handle_empty()
		return

	if(projectiles_to_fire > 1)
		addtimer(CALLBACK(src, PROC_REF(actual_fire), firing_target, (projectiles_to_fire - 1), TRUE), burst_fire_delay)

/obj/structure/machinery/defenses/sentry/proc/handle_empty()
	visible_message("[icon2html(src, viewers(src))] [SPAN_WARNING("The [name] beeps steadily and its ammo light blinks red.")]")
	playsound(loc, 'sound/weapons/smg_empty_alarm.ogg', 25, 1)
	update_icon()
	sent_empty_ammo = TRUE
	SEND_SIGNAL(src, COMSIG_SENTRY_EMPTY_AMMO_ALERT, src)

///muzzle flash
/obj/structure/machinery/defenses/sentry/proc/muzzle_flash(firing_angle)
	if(isnull(firing_angle))
		return
	if(muzzle_flash && !muzzle_flash.applied)
		var/atom/movable/flash_loc = loc
		var/prev_light = light_range
		if(!light_on && (light_range <= muzzle_flash_lum))
			set_light_range(muzzle_flash_lum)
			set_light_color(muzzle_flash_color)
			set_light_on(TRUE)
			addtimer(CALLBACK(src, PROC_REF(reset_light_range), prev_light), 0.2 SECONDS)
		//Offset the pixels.
		switch(firing_angle)
			if(0, 360)
				muzzle_flash.pixel_x = 0
				muzzle_flash.pixel_y = 13
				muzzle_flash.layer = initial(muzzle_flash.layer)
			if(1 to 44)
				muzzle_flash.pixel_x = round(6 * ((firing_angle) / 45))
				muzzle_flash.pixel_y = 13
				muzzle_flash.layer = initial(muzzle_flash.layer)
			if(45)
				muzzle_flash.pixel_x = 13
				muzzle_flash.pixel_y = 13
				muzzle_flash.layer = initial(muzzle_flash.layer)
			if(46 to 89)
				muzzle_flash.pixel_x = 13
				muzzle_flash.pixel_y = round(6 * ((90 - firing_angle) / 45))
				muzzle_flash.layer = initial(muzzle_flash.layer)
			if(90)
				muzzle_flash.pixel_x = 13
				muzzle_flash.pixel_y = 0
				muzzle_flash.layer = initial(muzzle_flash.layer)
			if(91 to 134)
				muzzle_flash.pixel_x = 13
				muzzle_flash.pixel_y = round(-4 * ((firing_angle - 90) / 45))
				muzzle_flash.layer = initial(muzzle_flash.layer)
			if(135)
				muzzle_flash.pixel_x = 13
				muzzle_flash.pixel_y = -10
				muzzle_flash.layer = initial(muzzle_flash.layer)
			if(136 to 179)
				muzzle_flash.pixel_x = round(4 * ((180 - firing_angle) / 45))
				muzzle_flash.pixel_y = -12
				muzzle_flash.layer = ABOVE_MOB_LAYER
			if(180)
				muzzle_flash.pixel_x = 0
				muzzle_flash.pixel_y = -12
				muzzle_flash.layer = ABOVE_MOB_LAYER
			if(181 to 224)
				muzzle_flash.pixel_x = round(-6 * ((firing_angle - 180) / 45))
				muzzle_flash.pixel_y = -12
				muzzle_flash.layer = ABOVE_MOB_LAYER
			if(225)
				muzzle_flash.pixel_x = -12
				muzzle_flash.pixel_y = -12
				muzzle_flash.layer = initial(muzzle_flash.layer)
			if(226 to 269)
				muzzle_flash.pixel_x = -12
				muzzle_flash.pixel_y = round(-12 * ((270 - firing_angle) / 45))
				muzzle_flash.layer = initial(muzzle_flash.layer)
			if(270)
				muzzle_flash.pixel_x = -12
				muzzle_flash.pixel_y = 0
				muzzle_flash.layer = initial(muzzle_flash.layer)
			if(271 to 313)
				muzzle_flash.pixel_x = -12
				muzzle_flash.pixel_y = round(8 * ((firing_angle - 270) / 45))
				muzzle_flash.layer = initial(muzzle_flash.layer)
			if(315)
				muzzle_flash.pixel_x = -12
				muzzle_flash.pixel_y = 13
				muzzle_flash.layer = initial(muzzle_flash.layer)
			if(316 to 359)
				muzzle_flash.pixel_x = round(-12 * ((360 - firing_angle) / 45))
				muzzle_flash.pixel_y = 13
				muzzle_flash.layer = initial(muzzle_flash.layer)

		muzzle_flash.transform = null
		muzzle_flash.transform = turn(muzzle_flash.transform, firing_angle)
		flash_loc.vis_contents += muzzle_flash
		muzzle_flash.applied = TRUE

		addtimer(CALLBACK(src, PROC_REF(remove_muzzle_flash), flash_loc, muzzle_flash), 0.2 SECONDS)


///Removes muzzle flash viscontents
/obj/structure/machinery/defenses/sentry/proc/remove_muzzle_flash(atom/movable/flash_loc, atom/movable/vis_obj/effect/muzzle_flash/muzzle_flash)
	if(!QDELETED(flash_loc))
		flash_loc.vis_contents -= muzzle_flash
	muzzle_flash.applied = FALSE

/// called by a timer to remove the light range from muzzle flash
/obj/structure/machinery/defenses/sentry/proc/reset_light_range(lightrange)
	set_light_range(lightrange)
	if(lightrange <= 0)
		set_light_on(FALSE)

/obj/structure/machinery/defenses/sentry/proc/get_target(atom/movable/new_target)
	if(!islist(targets))
		return
	if(!targets.Find(new_target))
		targets.Add(new_target)

	if(!length(targets))
		return

	var/list/conscious_targets = list()
	var/list/unconscious_targets = list()

	for(var/atom/movable/A in targets) // orange allows sentry to fire through gas and darkness
		if(isliving(A))
			var/mob/living/M = A
			if(M.stat & DEAD)
				if(A == target)
					target = null
				targets.Remove(A)
				continue

			if(M.get_target_lock(faction_group) || M.invisibility || HAS_TRAIT(M, TRAIT_ABILITY_BURROWED) || M.is_ventcrawling)
				if(M == target)
					target = null
				targets.Remove(M)
				continue

		else if(!(A.type in other_targets))
			if(A == target)
				target = null
			targets.Remove(A)
			continue

		if(!omni_directional)
			var/opp
			var/adj
			switch(dir)
				if(NORTH)
					opp = x-A.x
					adj = A.y-y
				if(SOUTH)
					opp = x-A.x
					adj = y-A.y
				if(EAST)
					opp = y-A.y
					adj = A.x-x
				if(WEST)
					opp = y-A.y
					adj = x-A.x

			var/r = 9999
			if(adj != 0)
				r = abs(opp/adj)
			var/angledegree = arcsin(r/sqrt(1+(r*r)))
			if(adj < 0 || (angledegree*2) > SENTRY_FIREANGLE)
				if(A == target)
					target = null
				targets.Remove(A)
				continue

		var/list/turf/path = get_line(src, A, include_start_atom = FALSE)
		if(!length(path) || get_dist(src, A) > sentry_range)
			if(A == target)
				target = null
			targets.Remove(A)
			continue

		var/blocked = FALSE
		for(var/turf/T in path)
			if(T.density || T.opacity)
				blocked = TRUE
				break

			for(var/obj/structure/S in T)
				if(S.opacity)
					blocked = TRUE
					break

			for(var/obj/vehicle/multitile/V in T)
				blocked = TRUE
				break

			for(var/obj/effect/particle_effect/smoke/S in T)
				blocked = TRUE
				break

		if(!omni_directional)
			var/turf/F = get_step(src, src.dir)
			if(F.density || F.opacity)
				blocked = TRUE

			for(var/obj/structure/S in F)
				if(F.opacity)
					blocked = TRUE
					break

			for(var/obj/vehicle/multitile/V in F)
				blocked = TRUE
				break

		if(blocked)
			if(A == target)
				target = null
			targets.Remove(A)
			continue

		if(isliving(A))
			var/mob/living/M = A
			if(M.stat & UNCONSCIOUS)
				unconscious_targets += M
			else
				conscious_targets += M

	if(length(conscious_targets))
		target = pick(conscious_targets)
	else if(length(unconscious_targets))
		target = pick(unconscious_targets)

	if(!target) //No targets, don't bother firing
		return

	fire(target)

/obj/structure/machinery/defenses/sentry/premade
	name = "\improper UA-577 Gauss Turret"
	immobile = TRUE
	turned_on = TRUE
	icon_state = "premade" //for the map editor only
	faction_group = FACTION_LIST_UA
	static = TRUE
	fire_delay = 5
	burst = 1

/obj/structure/machinery/defenses/sentry/premade/Initialize()
	. = ..()
	if(selected_categories[SENTRY_CATEGORY_IFF])
		selected_categories[SENTRY_CATEGORY_IFF] = FACTION_MARINE

/obj/structure/machinery/defenses/sentry/premade/get_examine_text(mob/user)
	. = ..()
	. += SPAN_NOTICE("It seems this one's bolts have been securely welded into the floor, and the access panel locked. You can't interact with it.")

/obj/structure/machinery/defenses/sentry/premade/attackby(obj/item/O, mob/user)
	return

/obj/structure/machinery/defenses/sentry/premade/power_on()
	return

/obj/structure/machinery/defenses/sentry/premade/power_off()
	return

/obj/structure/machinery/defenses/sentry/premade/damaged_action()
	return

/obj/structure/machinery/defenses/sentry/premade/dumb
	name = "modified UA-577 Gauss Turret"
	desc = "A deployable, semi-automated turret with AI targeting capabilities. Armed with an M30 Autocannon and a high-capacity drum magazine. This one's IFF system has been disabled, and it will open fire on any targets within range."
	faction_group = null
	ammo = new /obj/item/ammo_magazine/sentry

//the turret inside a static sentry deployment system
/obj/structure/machinery/defenses/sentry/premade/deployable
	name = "\improper UA-633 Static Gauss Turret"
	desc = "A fully-automated defence turret with mid-range targeting capabilities. Armed with a modified M32-S Autocannon and an internal belt feed."
	density = TRUE
	faction_group = FACTION_LIST_UA
	fire_delay = 1
	ammo = new /obj/item/ammo_magazine/sentry/premade
	var/obj/structure/machinery/sentry_holder/deployment_system

/obj/structure/machinery/defenses/sentry/premade/deployable/Destroy()
	if(deployment_system)
		deployment_system.deployed_turret = null
		deployment_system = null
	. = ..()

/obj/structure/machinery/defenses/sentry/premade/deployable/colony
	faction_group = list(FACTION_MARINE, FACTION_COLONIST, FACTION_SURVIVOR)

/obj/structure/machinery/defenses/sentry/premade/deployable/colony/Initialize()
	. = ..()
	choice_categories[SENTRY_CATEGORY_IFF] = list(SENTRY_FACTION_COLONY, SENTRY_FACTION_WEYLAND)
	selected_categories[SENTRY_CATEGORY_IFF] = SENTRY_FACTION_COLONY

/obj/structure/machinery/defenses/sentry/premade/deployable/wy
	name = "WY 5-GSE3 Static Turret"
	desc = "An old static, semi-automated turret with AI targeting capabilities from Weyland-Yutani."
	icon = 'icons/obj/structures/machinery/defenses/wy_static.dmi'
	defense_type = "Static"
	sentry_type = "wy_sentry"
	health = 350
	health_max = 350
	faction_group = list(FACTION_MARINE, FACTION_COLONIST, FACTION_SURVIVOR, FACTION_WY)
	fire_delay = 0.6 SECONDS
	damage_mult = 2

/obj/structure/machinery/defenses/sentry/premade/deployable/wy/Initialize()
	. = ..()
	choice_categories[SENTRY_CATEGORY_IFF] = list(SENTRY_FACTION_COLONY, SENTRY_FACTION_WEYLAND)
	selected_categories[SENTRY_CATEGORY_IFF] = SENTRY_FACTION_COLONY

/obj/structure/machinery/defenses/sentry/premade/deployable/almayer
	name = "\improper UA-635C Static Gauss Turret"
	desc = "A fully-automated defence turret with mid-range targeting capabilities. Armed with a modified M32-S Autocannon and an internal belt feed and modified for UA warship use."
	fire_delay = 0.4 SECONDS
	omni_directional = TRUE

/obj/structure/machinery/defenses/sentry/premade/deployable/almayer/mini
	name = "\improper UA 512-S mini sentry"
	desc = "A fully-automated defence turret with mid-range targeting capabilities. Armed with a modified M30 Autocannon and an internal belt feed and modified for UA warship use."
	defense_type = "Mini"
	fire_delay = 0.25 SECONDS
	health = 150
	health_max = 150
	damage_mult = 0.6
	density = FALSE
	layer = BELOW_MOB_LAYER
	disassemble_time = 0.75 SECONDS
	handheld_type = /obj/item/defenses/handheld/sentry/mini
	composite_icon = FALSE

/obj/structure/machinery/defenses/sentry/premade/deployable/colony/landing_zone
	name = "\improper UA-577 Spaceborne Gauss Turret"
	fire_delay = 2
	sentry_range = 10
	omni_directional = TRUE
	/// How long the battery for this turret lasts. Will warn low at 70% and critical at 90% use.
	var/battery_duration = 20 MINUTES
	/// The current battery state
	var/battery_state = TURRET_BATTERY_STATE_OK

/obj/structure/machinery/defenses/sentry/premade/deployable/colony/landing_zone/Initialize()
	. = ..()

	var/low_battery_time = ceil(battery_duration * 0.7)
	var/critical_battery_time = ceil(battery_duration * 0.9)
	addtimer(CALLBACK(src, PROC_REF(set_battery_state), TURRET_BATTERY_STATE_LOW), low_battery_time)
	addtimer(CALLBACK(src, PROC_REF(set_battery_state), TURRET_BATTERY_STATE_CRITICAL), critical_battery_time)
	addtimer(CALLBACK(src, PROC_REF(set_battery_state), TURRET_BATTERY_STATE_DEAD), battery_duration)

/obj/structure/machinery/defenses/sentry/premade/deployable/colony/landing_zone/get_examine_text(mob/user)
	. = ..()
	switch(battery_state)
		if(TURRET_BATTERY_STATE_OK)
			. += SPAN_INFO("Its battery indictor is green, fully charged.")
		if(TURRET_BATTERY_STATE_LOW)
			. += SPAN_INFO("Its battery indictor is flashing yellow.")
		if(TURRET_BATTERY_STATE_CRITICAL)
			. += SPAN_INFO("Its battery indictor is flashing red.")
		if(TURRET_BATTERY_STATE_DEAD)
			. += SPAN_INFO("It appears to be offline.")

/obj/structure/machinery/defenses/sentry/premade/deployable/colony/landing_zone/proc/set_battery_state(state)
	battery_state = state
	switch(state)
		if(TURRET_BATTERY_STATE_LOW)
			playsound(loc, 'sound/weapons/smg_empty_alarm.ogg', 15, 1)
			visible_message(SPAN_WARNING("[name] beeps steadily as its battery is getting low."))
		if(TURRET_BATTERY_STATE_CRITICAL)
			playsound(loc, 'sound/weapons/smg_empty_alarm.ogg', 20, 1)
			visible_message(SPAN_WARNING("[name] beeps steadily as its battery gets critically low."))
		if(TURRET_BATTERY_STATE_DEAD)
			playsound(loc, 'sound/machines/terminal_shutdown.ogg', 35, 1)
			turned_on = FALSE
			power_off_action()
			update_icon()

/obj/structure/machinery/defenses/sentry/premade/deployable/colony/landing_zone/set_range()
	var/range = sentry_range - 1
	var/dbl_range = range * 2

	if(omni_directional)
		range_bounds = SQUARE(x, y, dbl_range)
		return
	switch(dir)
		if(EAST)
			range_bounds = SQUARE(x+range, y, dbl_range)
		if(WEST)
			range_bounds = SQUARE(x-range, y, dbl_range)
		if(NORTH)
			range_bounds = SQUARE(x, y+range, dbl_range)
		if(SOUTH)
			range_bounds = SQUARE(x, y-range, dbl_range)

//the turret inside the shuttle sentry deployment system
/obj/structure/machinery/defenses/sentry/premade/dropship
	density = TRUE
	faction_group = FACTION_LIST_UA
	omni_directional = TRUE
	choice_categories = list()
	selected_categories = list()
	var/obj/structure/dropship_equipment/sentry_holder/deployment_system
	var/obj/structure/machinery/camera/cas/linked_cam

/obj/structure/machinery/defenses/sentry/premade/dropship/Destroy()
	if(deployment_system)
		deployment_system.deployed_turret = null
		deployment_system = null
	QDEL_NULL(linked_cam)
	. = ..()

/obj/structure/machinery/defenses/sentry/shotgun
	name = "\improper UA 12-G Shotgun Sentry"
	defense_type = "Shotgun"
	health = 250
	health_max = 250
	fire_delay = 2 SECONDS
	sentry_range = 3
	ammo = new /obj/item/ammo_magazine/sentry/shotgun

	accuracy_mult = 2 // Misses a lot since shotgun ammo has low accuracy, this should ensure a lot of shots actually hit.
	handheld_type = /obj/item/defenses/handheld/sentry/shotgun
	disassemble_time = 1.5 SECONDS

	firing_sound = null

/obj/structure/machinery/defenses/sentry/shotgun/attack_alien(mob/living/carbon/xenomorph/M)
	. = ..()
	if(. == XENO_ATTACK_ACTION && turned_on)
		M.visible_message(SPAN_DANGER("The sentry's steel tusks cut into [M]!"),
		SPAN_DANGER("The sentry's steel tusks cut into you!"), null, 5, CHAT_TYPE_XENO_COMBAT)
		M.apply_damage(20)

/obj/structure/machinery/defenses/sentry/shotgun/hitby(atom/movable/AM)
	if(AM.throwing && turned_on)
		if(ismob(AM))
			var/mob/living/L = AM
			L.apply_damage(20)
			playsound(L, "bonk", 75, FALSE)
			L.visible_message(SPAN_DANGER("The sentry's steel tusks impale [L]!"),
			SPAN_DANGER("The sentry's steel tusks impale you!"))
			if(L.mob_size <= MOB_SIZE_XENO_SMALL)
				L.apply_effect(1, WEAKEN)

/obj/structure/machinery/defenses/sentry/mini
	name = "\improper UA 512-M mini sentry"
	defense_type = "Mini"
	fire_delay = 0.15 SECONDS
	health = 150
	health_max = 150
	damage_mult = 0.4
	density = FALSE
	disassemble_time = 0.75 SECONDS
	handheld_type = /obj/item/defenses/handheld/sentry/mini
	composite_icon = FALSE

	firing_sound = null

/obj/structure/machinery/defenses/sentry/launchable
	name = "\improper UA 571-O sentry post"
	desc = "A deployable, omni-directional automated turret with AI targeting capabilities. Armed with an M30 Autocannon and a 100-round drum magazine with 500 rounds stored internally.  Due to the deployment method it is incapable of being moved."
	ammo = new /obj/item/ammo_magazine/sentry/dropped
	faction_group = FACTION_LIST_UA
	omni_directional = TRUE
	additional_rounds_stored = TRUE
	immobile = TRUE
	static = TRUE
	/// Cost to give sentry extra health
	var/upgrade_cost = 5
	/// Amount of bonus health they get from upgrade
	var/health_upgrade = 50
	var/obj/structure/machinery/camera/cas/linked_cam
	var/static/sentry_count = 1
	var/sentry_number
	luminosity_strength = 9

/obj/structure/machinery/defenses/sentry/launchable/Initialize()
	. = ..()
	sentry_number = sentry_count
	sentry_count++

/obj/structure/machinery/defenses/sentry/launchable/Destroy()
	QDEL_NULL(linked_cam)
	. = ..()

/obj/structure/machinery/defenses/sentry/launchable/power_on_action()
	. = ..()
	linked_cam = new(loc, "[name] [sentry_number] at [get_area(src)] ([obfuscate_x(x)], [obfuscate_y(y)])")

/obj/structure/machinery/defenses/sentry/launchable/power_off_action()
	. = ..()
	QDEL_NULL(linked_cam)


/obj/structure/machinery/defenses/sentry/launchable/attackby(obj/item/stack/sheets, mob/user)
	. = ..()

	if(!istype(sheets, /obj/item/stack/sheet/metal))
		to_chat(user, SPAN_WARNING("Use [upgrade_cost] metal sheets to give the sentry some plating."))
		return

	if(upgraded)
		to_chat(user, SPAN_WARNING("\The [src] has already been upgraded."))
		return

	if(sheets.amount >= upgrade_cost)
		if(!do_after(user, 4 SECONDS * user.get_skill_duration_multiplier(SKILL_CONSTRUCTION) , INTERRUPT_ALL, BUSY_ICON_FRIENDLY))
			to_chat(user, SPAN_WARNING("You were interrupted! Try to stay still while you bolster the sentry with metal sheets..."))
			return

		if(sheets.use(upgrade_cost))
			src.health_max += health_upgrade
			src.update_health(-health_upgrade)
			upgraded = TRUE
			to_chat(user, SPAN_WARNING("You added some metal plating to the sentry, increasing its durability!"))
		else
			to_chat(user, SPAN_WARNING("You need at least [upgrade_cost] sheets of metal to upgrade this."))
	else
		to_chat(user, SPAN_WARNING("You need at least [upgrade_cost] sheets of metal to upgrade this."))

/obj/structure/machinery/defenses/sentry/launchable/attack_hand_checks(mob/user)
	// Reloads the sentry using inherent rounds
	if(!turned_on && additional_rounds_stored && (ammo.current_rounds < ammo.max_rounds))
		if(!do_after(user, 2 SECONDS * user.get_skill_duration_multiplier(SKILL_ENGINEER), INTERRUPT_ALL, BUSY_ICON_FRIENDLY))
			to_chat(user, SPAN_WARNING("You were interrupted! Try to stay still while you reload the sentry..."))
			return

		var/rounds_used = ammo.inherent_reload(user)
		to_chat(user, SPAN_WARNING("[src]'s internal magazine was reloaded with [rounds_used] rounds, [ammo.max_inherent_rounds] rounds left in storage"))
		playsound(loc, 'sound/weapons/handling/m40sd_reload.ogg', 25, 1)
		update_icon()
		return FALSE
	else

		return TRUE // We want to be able to turn it on / off while keeping it immobile

/obj/structure/machinery/defenses/sentry/launchable/handle_empty()
	// Checks if its completely dry or just needs reload, deconstruct if completely empty
	if(ammo.max_inherent_rounds > 0)
		visible_message(SPAN_WARNING("\The [name] beeps steadily and its ammo light blinks red. It still has rounds, requires manual reload!"))
		playsound(loc, 'sound/weapons/smg_empty_alarm.ogg', 25, 1)
		update_icon()
	else
		visible_message(SPAN_WARNING("\The [name] beeps steadily and its ammo light blinks red. It rapidly deconstructs itself!"))
		playsound(loc, 'sound/weapons/smg_empty_alarm.ogg', 25, 1)
		deconstruct()

/obj/structure/machinery/defenses/sentry/launchable/deconstruct(disassembled = TRUE)
	if(disassembled)
		new /obj/item/stack/sheet/metal/medium_stack(loc)
		new /obj/item/stack/sheet/plasteel/medium_stack(loc)
	return ..()

/obj/structure/machinery/defenses/sentry/launchable/upp
	name = "\improper UPPA 32-O rapid deploy sentry"
	icon_state = "upp_defense_base"
	icon_on = "upp_defense_base"
	icon_off = "upp_defense_base_off"
	choice_categories = list(
		SENTRY_CATEGORY_IFF = list(FACTION_UPP, SENTRY_FACTION_HUMAN),
	)
	selected_categories = list(
		SENTRY_CATEGORY_IFF = FACTION_UPP,
	)
	faction_group = FACTION_LIST_UPP
	start_up_message = "Sentry mounted and loaded. Glory to the UPP."
	defense_type = "UPP"
	handheld_type = /obj/item/defenses/handheld/sentry/upp
	fire_delay = 1.2
	firing_sound = 'sound/weapons/gun_type71.ogg'
	ammo = new /obj/item/ammo_magazine/sentry/upp/dropped

/obj/structure/machinery/defenses/sentry/wy
	name = "WY 202-GMA1 Smart Sentry"
	desc = "A deployable, fully-automated turret with AI targeting capabilities used by the PMC."
	icon = 'icons/obj/structures/machinery/defenses/wy_defenses.dmi'
	sentry_type = "wy_sentry"
	fire_delay = 2 SECONDS
	health = 350
	health_max = 350
	damage_mult = 3.5
	disassemble_time = 5 SECONDS
	hack_time = 25 SECONDS
	sentry_range = 6
	omni_directional = TRUE
	handheld_type = /obj/item/defenses/handheld/sentry/wy
	ammo = new /obj/item/ammo_magazine/sentry/wy
	selected_categories = list(
		SENTRY_CATEGORY_IFF = SENTRY_FACTION_WEYLAND,
	)

/obj/structure/machinery/defenses/sentry/mini/wy
	name = "WY 14-GRA2 Mini Sentry"
	desc = "A deployable, semi-automated turret with AI targeting capabilities used by the PMC."
	icon = 'icons/obj/structures/machinery/defenses/wy_defenses.dmi'
	sentry_type = "wy_sentry"
	fire_delay = 0.08 SECONDS
	health = 200
	health_max = 200
	damage_mult = 0.3
	disassemble_time = 2 SECONDS
	hack_time = 25 SECONDS
	handheld_type = /obj/item/defenses/handheld/sentry/wy/mini
	ammo = new /obj/item/ammo_magazine/sentry/wy/mini
	selected_categories = list(
		SENTRY_CATEGORY_IFF = SENTRY_FACTION_WEYLAND,
	)

/obj/structure/machinery/defenses/sentry/dmr/wy
	name = "WY 2-ADT-A3 Heavy Sentry"
	desc = "A deployable, semi-automated turret with AI targeting capabilities used by the PMC."
	defense_type = "Heavy"
	icon = 'icons/obj/structures/machinery/defenses/wy_heavy.dmi'
	sentry_type = "wy_sentry"
	fire_delay = 4 SECONDS
	health = 600
	health_max = 600
	damage_mult = 5
	disassemble_time = 10 SECONDS
	hack_time = 25 SECONDS
	sentry_range = 8
	handheld_type = /obj/item/defenses/handheld/sentry/wy
	ammo = new /obj/item/ammo_magazine/sentry/wy
	selected_categories = list(
		SENTRY_CATEGORY_IFF = SENTRY_FACTION_WEYLAND,
	)

/obj/structure/machinery/defenses/sentry/upp
	name = "\improper UPPA 32-H sentry gun"
	desc = "A deployable, semi-automated turret with AI targeting capabilities. Armed with an AK-500 Autocannon and a 350-round drum magazine."
	icon_state = "upp_defense_base"
	icon_on = "upp_defense_base"
	icon_off = "upp_defense_base_off"
	choice_categories = list(
		SENTRY_CATEGORY_IFF = list(FACTION_UPP, SENTRY_FACTION_HUMAN),
	)

	selected_categories = list(
		SENTRY_CATEGORY_IFF = FACTION_UPP,
	)
	start_up_message = "Sentry mounted and loaded. Glory to the UPP."
	defense_type = "UPP"
	handheld_type = /obj/item/defenses/handheld/sentry/upp
	fire_delay = 1.2
	firing_sound = 'sound/weapons/gun_type71.ogg'
	ammo = new /obj/item/ammo_magazine/sentry/upp

/obj/structure/machinery/defenses/sentry/upp/light
	name = "UPP SDS-R8 Light Sentry"
	defense_type = "Light"
	fire_delay = 0.3 SECONDS
	health = 200
	health_max = 200
	disassemble_time = 2 SECONDS
	sentry_range = 3
	omni_directional = TRUE
	handheld_type = /obj/item/defenses/handheld/sentry/upp/light

#undef SENTRY_FIREANGLE
#undef SENTRY_RANGE
