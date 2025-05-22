/datum/caste_datum/neomorph
	caste_type = NEOMORPH_GROWN
	tier = 2

	melee_damage_lower = XENO_DAMAGE_TIER_4
	melee_damage_upper = XENO_DAMAGE_TIER_4
	melee_vehicle_damage = XENO_DAMAGE_TIER_4
	max_health = XENO_HEALTH_TIER_6
	plasma_gain = XENO_PLASMA_GAIN_TIER_8
	plasma_max = XENO_PLASMA_TIER_4
	xeno_explosion_resistance = XENO_EXPLOSIVE_ARMOR_TIER_2
	armor_deflection = XENO_NO_ARMOR
	evasion = XENO_EVASION_LOW
	speed = XENO_SPEED_TIER_9

	attack_delay = 2 // VERY high slash damage, but attacks relatively slowly

	available_strains = list()
	behavior_delegate_type = /datum/behavior_delegate/neomorph_base

	deevolves_to = list()
	caste_desc = "A fast, powerful combatant."
	evolves_to = list()

	heal_resting = 1
	minimum_evolve_time = 0

	minimap_icon = "neomorph"

/mob/living/carbon/xenomorph/neomorph
	caste_type = NEOMORPH_GROWN
	name = NEOMORPH_GROWN
	desc = "A sleek, fast alien with sharp claws."
	icon_size = 48
	icon_state = "Neomorph Walking"
	plasma_types = list()
	pixel_x = -12
	old_x = -12
	tier = 2
	organ_value = 10000
	base_actions = list(
		/datum/action/xeno_action/onclick/xeno_resting,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/activable/tail_stab,
		/datum/action/xeno_action/activable/pounce/runner/neomorph,
		/datum/action/xeno_action/activable/headbite,
		/datum/action/xeno_action/onclick/tacmap,
	)
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
	)
	claw_type = CLAW_TYPE_SHARP

	tackle_min = 2
	tackle_max = 6

	icon_xeno = 'icons/mob/neo/neomorph.dmi'
	icon_xenonid = 'icons/mob/neo/neomorph.dmi'
	need_weeds = FALSE

	weed_food_icon = 'icons/mob/xenos/weeds_48x48.dmi'
	weed_food_states = list("Drone_1","Drone_2","Drone_3")
	weed_food_states_flipped = list("Drone_1","Drone_2","Drone_3")

	AUTOWIKI_SKIP(TRUE)
	hivenumber = XENO_HIVE_NEOMORPH
	speaking_noise = "neo_talk"

/datum/behavior_delegate/neomorph_base
	name = "Base Neomorph Behavior Delegate"

	// Config
	var/slash_slow_duration = 35

/datum/behavior_delegate/neomorph_base/melee_attack_additional_effects_target(mob/living/carbon/target_carbon)
	if (!isxeno_human(target_carbon))
		return

	if (HAS_TRAIT(target_carbon, TRAIT_FLOORED))
		new /datum/effects/xeno_slow(target_carbon, bound_xeno, null, null, get_xeno_stun_duration(target_carbon, slash_slow_duration))

	return

/datum/action/xeno_action/activable/pounce/runner/neomorph
	xeno_cooldown = 5 SECONDS
	knockdown = TRUE // Should we knock down the target?
	knockdown_duration = 1
	slash = TRUE // Do we slash upon reception?
	freeze_self = TRUE // Should we freeze ourselves after the lunge?
	freeze_time = 5
	can_be_shield_blocked = TRUE // Some legacy stuff, self explanatory
