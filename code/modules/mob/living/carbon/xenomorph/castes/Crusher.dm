/datum/caste_datum/crusher
	caste_type = XENO_CASTE_CRUSHER
	tier = 3

	melee_damage_lower = XENO_DAMAGE_TIER_5
	melee_damage_upper = XENO_DAMAGE_TIER_5
	melee_vehicle_damage = XENO_DAMAGE_TIER_5 * 8
	max_health = XENO_HEALTH_IMMORTAL
	plasma_gain = XENO_PLASMA_GAIN_TIER_7
	plasma_max = XENO_PLASMA_TIER_8
	xeno_explosion_resistance = XENO_EXPLOSIVE_ARMOR_TIER_10
	armor_deflection = XENO_ARMOR_TIER_3
	evasion = XENO_EVASION_NONE
	speed = XENO_SPEED_TIER_4
	heal_standing = 0.66

	available_strains = list(/datum/xeno_strain/charger)
	behavior_delegate_type = /datum/behavior_delegate/crusher_charger

	minimum_evolve_time = 15 MINUTES

	tackle_min = 2
	tackle_max = 6
	tackle_chance = 25

	evolution_allowed = FALSE
	deevolves_to = list(XENO_CASTE_WARRIOR)
	caste_desc = "A huge tanky xenomorph."
	fire_intensity_resistance = 20
	fire_vulnerability_mult = 0.25

	minimap_icon = "crusher"

/mob/living/carbon/xenomorph/crusher
	caste_type = XENO_CASTE_CRUSHER
	name = XENO_CASTE_CRUSHER
	desc = "A huge alien with an enormous armored crest."
	icon_size = 64
	icon_state = "Crusher Walking"
	plasma_types = list(PLASMA_CHITIN)
	tier = 3
	drag_delay = 6 //pulling a big dead xeno is hard
	melee_sentry_damage_multiplier = 2

	small_explosives_stun = FALSE

	mob_size = MOB_SIZE_IMMOBILE

	pixel_x = -16
	pixel_y = -3
	old_x = -16
	old_y = -3
	base_pixel_x = 0
	base_pixel_y = -16

	rebounds = FALSE // no more fucking pinball crooshers
	organ_value = 3000
	base_actions = list(
		/datum/action/xeno_action/onclick/xeno_resting,
		/datum/action/xeno_action/onclick/regurgitate,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/activable/tail_stab,
		/datum/action/xeno_action/activable/fling/charger,
		/datum/action/xeno_action/onclick/charger_charge,
		/datum/action/xeno_action/onclick/crusher_stomp,
		/datum/action/xeno_action/onclick/crusher_shield,
		/datum/action/xeno_action/onclick/tacmap,
	)

	claw_type = CLAW_TYPE_VERY_SHARP

	icon_xeno = 'icons/mob/xenos/crusher.dmi'
	icon_xenonid = 'icons/mob/xenonids/crusher.dmi'

	weed_food_icon = 'icons/mob/xenos/weeds_64x64.dmi'
	weed_food_states = list("Crusher_1","Crusher_2","Crusher_3")
	weed_food_states_flipped = list("Crusher_1","Crusher_2","Crusher_3")

	ai_range = 24
	forced_retarget_time = (3 SECONDS)

/mob/living/carbon/xenomorph/crusher/init_movement_handler()
	return new /datum/xeno_ai_movement/crusher(src)

/mob/living/carbon/xenomorph/crusher/Initialize(mapload, mob/living/carbon/xenomorph/oldXeno, h_number, ai_hard_off = FALSE)
	. = ..()
	AddComponent(/datum/component/footstep, 2, 50, 15, 1, "metalbang")

	playsound(src, 'sound/voice/alien_death_unused.ogg', 100, TRUE, 30, falloff = 5)
	if(!get_turf(src)) //autowiki compat, spawns in nullspace
		return
	for(var/mob/current_mob as anything in get_mobs_in_z_level_range(get_turf(src), 30) - src)
		var/relative_dir = get_dir(current_mob, src)
		var/final_dir = dir2text(relative_dir)
		to_chat(current_mob, SPAN_HIGHDANGER("You hear a terrible roar coming from [final_dir ? "the [final_dir]" : "nearby"] as the ground shakes!"))
		for(var/turf/closed/wall/wall in orange(1, src))
			wall.ex_act(1000 * 1.5)


/mob/living/carbon/xenomorph/crusher/death(cause, gibbed)
	. = ..()
	playsound(src, 'sound/voice/alien_crusher_death.ogg', 50, FALSE, 15)


// Refactored to handle all of crusher's interactions with object during charge.
/mob/living/carbon/xenomorph/proc/handle_collision(atom/target)
	if(!target)
		return FALSE

	//Barricade collision
	else if (istype(target, /obj/structure/barricade))
		var/obj/structure/barricade/B = target
		visible_message(SPAN_DANGER("[src] rams into [B] and skids to a halt!"), SPAN_XENOWARNING("We ram into [B] and skid to a halt!"))

		B.Collided(src)
		. =  FALSE

	else if (istype(target, /obj/vehicle/multitile))
		var/obj/vehicle/multitile/M = target
		visible_message(SPAN_DANGER("[src] rams into [M] and skids to a halt!"), SPAN_XENOWARNING("We ram into [M] and skid to a halt!"))

		M.Collided(src)
		. = FALSE

	else if (istype(target, /obj/structure/machinery/m56d_hmg))
		var/obj/structure/machinery/m56d_hmg/HMG = target
		visible_message(SPAN_DANGER("[src] rams [HMG]!"), SPAN_XENODANGER("We ram [HMG]!"))
		playsound(loc, "punch", 25, 1)
		HMG.CrusherImpact()
		. =  FALSE

	else if (istype(target, /obj/structure/window))
		var/obj/structure/window/W = target
		if (W.unacidable)
			. = FALSE
		else
			W.deconstruct(FALSE)
			. =  TRUE // Continue throw

	else if (istype(target, /obj/structure/machinery/door/airlock))
		var/obj/structure/machinery/door/airlock/A = target

		if (A.unacidable)
			. = FALSE
		else
			A.deconstruct()

	else if (istype(target, /obj/structure/grille))
		var/obj/structure/grille/G = target
		if(G.unacidable)
			. =  FALSE
		else
			G.health -=  80 //Usually knocks it down.
			G.healthcheck()
			. = TRUE

	else if (istype(target, /obj/structure/surface/table))
		var/obj/structure/surface/table/T = target
		T.Crossed(src)
		. = TRUE

	else if (istype(target, /obj/structure/machinery/defenses))
		var/obj/structure/machinery/defenses/DF = target
		visible_message(SPAN_DANGER("[src] rams [DF]!"), SPAN_XENODANGER("We ram [DF]!"))

		if (!DF.unacidable)
			playsound(loc, "punch", 25, 1)
			DF.stat = 1
			DF.update_icon()
			DF.update_health(40)

		. =  FALSE

	else if (istype(target, /obj/structure/machinery/vending))
		var/obj/structure/machinery/vending/V = target

		if (V.unslashable)
			. = FALSE
		else
			visible_message(SPAN_DANGER("[src] smashes straight into [V]!"), SPAN_XENODANGER("We smash straight into [V]!"))
			playsound(loc, "punch", 25, 1)
			V.tip_over()

			var/impact_range = 1
			var/turf/TA = get_diagonal_step(V, dir)
			TA = get_step_away(TA, src)
			var/launch_speed = 2
			launch_towards(TA, impact_range, launch_speed)

			. =  TRUE

	else if (istype(target, /obj/structure/machinery/cm_vending))
		var/obj/structure/machinery/cm_vending/V = target
		if (V.unslashable)
			. = FALSE
		else
			visible_message(SPAN_DANGER("[src] smashes straight into [V]!"), SPAN_XENODANGER("We smash straight into [V]!"))
			playsound(loc, "punch", 25, 1)
			V.tip_over()

			var/impact_range = 1
			var/turf/TA = get_diagonal_step(V, dir)
			TA = get_step_away(TA, src)
			var/launch_speed = 2
			throw_atom(TA, impact_range, launch_speed)

			. =  TRUE

	// Anything else?
	else
		if (isobj(target))
			var/obj/O = target
			if (O.unacidable)
				. = FALSE
			else if (O.anchored)
				visible_message(SPAN_DANGER("[src] crushes [O]!"), SPAN_XENODANGER("We crush [O]!"))
				if(length(O.contents)) //Hopefully won't auto-delete things inside crushed stuff.
					var/turf/T = get_turf(src)
					for(var/atom/movable/S in T.contents) S.forceMove(T)

				qdel(O)
				. = TRUE

			else
				if(O.buckled_mob)
					O.unbuckle()
				visible_message(SPAN_WARNING("[src] knocks [O] aside!"), SPAN_XENOWARNING("We knock [O] aside.")) //Canisters, crates etc. go flying.
				playsound(loc, "punch", 25, 1)

				var/impact_range = 2
				var/turf/TA = get_diagonal_step(O, dir)
				TA = get_step_away(TA, src)
				var/launch_speed = 2
				throw_atom(TA, impact_range, launch_speed)

				. = TRUE

	if (!.)
		update_icons()

// Mutator delegate for base crusher
/datum/behavior_delegate/crusher_base
	name = "Base Crusher Behavior Delegate"

	var/aoe_slash_damage_reduction = 0.40

	/// Utilized to update charging animation.
	var/is_charging = FALSE

/datum/behavior_delegate/crusher_base/melee_attack_additional_effects_target(mob/living/carbon/A)

	if (!isxeno_human(A))
		return

	new /datum/effects/xeno_slow(A, bound_xeno, , , 20)

	var/damage = bound_xeno.melee_damage_upper * aoe_slash_damage_reduction

	var/base_cdr_amount = 15
	var/cdr_amount = base_cdr_amount
	for (var/mob/living/carbon/H in orange(1, A))
		if (H.stat == DEAD)
			continue

		if(!isxeno_human(H) || bound_xeno.can_not_harm(H))
			continue

		cdr_amount += 5

		bound_xeno.visible_message(SPAN_DANGER("[bound_xeno] slashes [H]!"), \
			SPAN_DANGER("You slash [H]!"), null, null, CHAT_TYPE_XENO_COMBAT)

		bound_xeno.flick_attack_overlay(H, "slash")

		H.last_damage_data = create_cause_data(initial(bound_xeno.name), bound_xeno)

		//Logging, including anti-rulebreak logging
		if(H.status_flags & XENO_HOST && H.stat != DEAD)
			if(HAS_TRAIT(H, TRAIT_NESTED)) //Host was buckled to nest while infected, this is a rule break
				H.attack_log += text("\[[time_stamp()]\] <font color='orange'><B>was slashed by [key_name(bound_xeno)] while they were infected and nested</B></font>")
				bound_xeno.attack_log += text("\[[time_stamp()]\] <font color='red'><B>slashed [key_name(H)] while they were infected and nested</B></font>")
				message_admins("[key_name(bound_xeno)] slashed [key_name(H)] while they were infected and nested.") //This is a blatant rulebreak, so warn the admins
			else //Host might be rogue, needs further investigation
				H.attack_log += text("\[[time_stamp()]\] <font color='orange'>was slashed by [key_name(bound_xeno)] while they were infected</font>")
				bound_xeno.attack_log += text("\[[time_stamp()]\] <font color='red'>slashed [key_name(src)] while they were infected</font>")
		else //Normal xenomorph friendship with benefits
			H.attack_log += text("\[[time_stamp()]\] <font color='orange'>was slashed by [key_name(bound_xeno)]</font>")
			bound_xeno.attack_log += text("\[[time_stamp()]\] <font color='red'>slashed [key_name(H)]</font>")
		log_attack("[key_name(bound_xeno)] slashed [key_name(H)]")


		H.apply_armoured_damage(get_xeno_damage_slash(H, damage), ARMOR_MELEE, BRUTE, bound_xeno.zone_selected)

	var/datum/action/xeno_action/activable/pounce/crusher_charge/cAction = get_action(bound_xeno, /datum/action/xeno_action/activable/pounce/crusher_charge)
	if (!cAction.action_cooldown_check())
		cAction.reduce_cooldown(cdr_amount)

	var/datum/action/xeno_action/onclick/crusher_shield/sAction = get_action(bound_xeno, /datum/action/xeno_action/onclick/crusher_shield)
	if (!sAction.action_cooldown_check())
		sAction.reduce_cooldown(base_cdr_amount)

/datum/behavior_delegate/crusher_base/append_to_stat()
	. = list()
	var/shield_total = 0
	for (var/datum/xeno_shield/XS in bound_xeno.xeno_shields)
		if (XS.shield_source == XENO_SHIELD_SOURCE_CRUSHER)
			shield_total += XS.amount

	. += "Shield: [shield_total]"

/datum/behavior_delegate/crusher_base/on_update_icons()
	if(HAS_TRAIT(bound_xeno, TRAIT_CHARGING) && bound_xeno.body_position == STANDING_UP)
		bound_xeno.icon_state = "[bound_xeno.get_strain_icon()] Crusher Charging"
		return TRUE
