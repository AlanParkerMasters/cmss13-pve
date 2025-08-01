//=========================//MARINES\\===================================//
//=======================================================================//


/obj/item/clothing/under/marine
	name = "\improper USCM uniform"
	desc = "Standard-issue Marine uniform, with venlar armor inserts at critical areas to protect from blades and ballistics."
	siemens_coefficient = 0.9
	icon_state = "marine_jumpsuit"
	worn_state = "marine_jumpsuit"
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_LOW
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	drop_sound = "armorequip"
	///Makes it so that we can see the right name in the vendor.
	var/specialty = "USCM"
	///List of map variants that use sleeve rolling on something else, like snow uniforms rolling the collar, and therefore shouldn't hide patches etc when rolled.
	var/list/map_variants_roll_accessories = list("s_")
	layer = UPPER_ITEM_LAYER

	//speciality does NOTHING if you have NO_NAME_OVERRIDE

/obj/item/clothing/under/marine/Initialize(mapload, new_protection[] = list(MAP_ICE_COLONY = ICE_PLANET_MIN_COLD_PROT), override_icon_state[] = null)
	if(!(flags_atom & NO_NAME_OVERRIDE))
		name = "[specialty]"
		if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
			name += " cold-weather uniform"
		else
			name += " uniform"
	if(!(flags_atom & NO_SNOW_TYPE))
		select_gamemode_skin(type, override_icon_state, new_protection)
	. = ..() //Done after above in case gamemode skin is missing sprites.

/obj/item/clothing/under/marine/set_sensors(mob/user)
	if(!skillcheckexplicit(user, SKILL_ANTAG, SKILL_ANTAG_AGENT))
		to_chat(user, SPAN_WARNING("The sensors in \the [src] can't be modified."))
		return
	. = ..()

/obj/item/clothing/under/marine/standard
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/medic
	name = "\improper USCM corpsman uniform"
	desc = "Standard-issue Marine hospital corpsman fatigues with venlar armor inserts at critical areas to protect from blades and ballistics."
	icon_state = "marine_medic"
	worn_state = "marine_medic"
	specialty = "USCM Hospital Corpsman"

/obj/item/clothing/under/marine/medic/standard
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/engineer
	name = "\improper USCM combat technician uniform"
	desc = "USCMC combat technician's fatigues, shielded by venlar panels and no longer electrically insulated due to 'budget reprioritization'."
	icon_state = "marine_engineer"
	worn_state = "marine_engineer"
	specialty = "USCM Combat Technician"

/obj/item/clothing/under/marine/engineer/standard
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/engineer/darker
	icon_state = "d_marine_engineer"
	worn_state = "d_marine_engineer"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/rto
	name = "\improper USCM radio telephone operator uniform"
	desc = "The uniform of a USCMC radio-telephone operator. Venlar panels provide marginal protection from shrapnel and ballistics."
	icon_state = "marine_rto"
	item_state = "marine_rto"
	specialty = "marine Radio Telephone Operator"

/obj/item/clothing/under/marine/sniper
	name = "\improper USCM sniper uniform"
	flags_jumpsuit = FALSE
	specialty = "USCM Sniper"

/obj/item/clothing/under/marine/tanker
	name = "\improper USCM tanker uniform"
	icon_state = "marine_tanker"
	worn_state = "marine_tanker"
	flags_jumpsuit = FALSE
	specialty = "USCM tanker"

/obj/item/clothing/under/marine/tanker/New(loc,
	new_protection = list(MAP_ICE_COLONY = ICE_PLANET_MIN_COLD_PROT),
	override_icon_state = list(MAP_ICE_COLONY = "s_marine_tanker"))

	..(loc, new_protection, override_icon_state)

/obj/item/clothing/under/marine/chef
	name = "\improper USCM Mess Technician uniform"
	desc = "The stain resistant uniform of a mess technician. Why the USCMC requires them to wear the venlar armor inserts is unknown."
	icon_state = "chef_uniform"
	worn_state = "chef_uniform"
	flags_jumpsuit = FALSE
	specialty = "USCM mess technician"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/mp
	name = "USCMC military police uniform"
	desc = "Cut and stab resistant USCMC military police uniform. The venlar liner also offers marginal ballistic defense."
	icon_state = "MP_jumpsuit"
	worn_state = "MP_jumpsuit"
	suit_restricted = list(/obj/item/clothing/suit/storage/marine, /obj/item/clothing/suit/armor/riot/marine, /obj/item/clothing/suit/storage/jacket/marine/service/mp)
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_SLEEVE_CUTTABLE|UNIFORM_JACKET_REMOVABLE
	specialty = "military police"

/obj/item/clothing/under/marine/mp/standard
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/mp/darker
	icon_state = "d_MP_jumpsuit"
	worn_state = "d_MP_jumpsuit"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/warden
	name = "military warden jumpsuit"
	desc = "Military Police Warden's jumpsuit. Armored as per usual."
	icon_state = "warden_jumpsuit"
	worn_state = "warden_jumpsuit"
	suit_restricted = list(/obj/item/clothing/suit/storage/marine, /obj/item/clothing/suit/armor/riot/marine, /obj/item/clothing/suit/storage/jacket/marine/service/warden)
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_SLEEVE_CUTTABLE|UNIFORM_JACKET_REMOVABLE
	specialty = "military warden"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer
	name = "marine officer uniform"
	desc = "Substantially comfier officer's uniform. Still has the protection of a sheet of paper against actual threats but at least you won't be uncomfortable while bleeding out."
	icon_state = "officertanclothes"
	item_state = "officertanclothes"
	worn_state = "officertanclothes"
	suit_restricted = null //so most officers can wear whatever suit they want
	flags_jumpsuit = FALSE
	specialty = "marine officer"
	black_market_value = 25

/obj/item/clothing/under/marine/officer/intel
	name = "\improper marine intelligence officer sweatsuit"
	desc = "Intelligence work is dangerous, but it's slightly less dangerous when your duty uniform can almost stop a bullet. Also features many pockets and attachment points for all storage needs."
	icon_state = "io"
	item_state = "io"
	worn_state = "io"
	specialty = "marine intelligence officer"

/obj/item/clothing/under/marine/officer/warrant
	name = "\improper USCM MP chief uniform"
	desc = "USCMC Military Police Chief's uniform. Alongside the standard armor panels, it has an uncomfortable energy dispersive polymer lining, and is also rated for low MOPP conditions."
	icon_state = "WO_jumpsuit"
	item_state = "WO_jumpsuit"
	worn_state = "WO_jumpsuit"
	suit_restricted = list(/obj/item/clothing/suit/storage/marine, /obj/item/clothing/suit/armor/riot/marine, /obj/item/clothing/suit/storage/jacket/marine/service/cmp)
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	specialty = "chief MP"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer/technical
	name = "technical officer uniform"
	icon_state = "johnny"
	worn_state = "johnny"
	specialty = "technical officer"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer/pilot
	name = "pilot bodysuit"
	desc = "A bodysuit worn by pilots of the USCM & USASF, good for operating express elevators to hell. Some armor protection provided by the venlar armor weave against shrapnel and ballistics."
	icon_state = "pilot_flightsuit"
	item_state = "pilot_flightsuit"
	worn_state = "pilot_flightsuit"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_NAME_OVERRIDE
	flags_cold_protection = ICE_PLANET_MIN_COLD_PROT
	suit_restricted = list(/obj/item/clothing/suit/armor/vest/pilot, /obj/item/clothing/suit/storage/marine/light/vest/dcc, /obj/item/clothing/suit/storage/jacket/marine/pilot, /obj/item/clothing/suit/storage/marine/light/vest)

/obj/item/clothing/under/marine/officer/pilot/flight
	name = "tactical pilot flightsuit"
	desc = "A flightsuit worn by pilots of the USCM & USASF, with plenty of leather straps, pouches, and other essential gear you will never use. Looks badass."
	icon_state = "pilot_flightsuit_alt"
	item_state = "pilot_flightsuit_alt"
	worn_state = "pilot_flightsuit_alt"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	flags_cold_protection = ICE_PLANET_MIN_COLD_PROT

/obj/item/clothing/under/marine/officer/pilot/dcc
	name = "dropship crew chief bodysuit"
	desc = "Dropship crew chief's bodysuit. The program that procured the latest line for some reason implemented a dozen odd survival features into it, which all don't really work. It also accepts standard venlar panels."
	icon_state = "crewchief_flightsuit"
	item_state = "crewchief_flightsuit"
	worn_state = "crewchief_flightsuit"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/under/marine/officer/tanker
	name = "vehicle crewman uniform"
	desc = "Armored vehicle crew uniform worn by tankers and cav crew of the USCMC. Shrapnel protection provided by venlar panels, badassery hinges on how well the operator works their vehicle. Do the Corps proud."
	icon_state = "marine_tanker"
	worn_state = "marine_tanker"
	suit_restricted = list(/obj/item/clothing/suit/storage/marine/tanker, /obj/item/clothing/suit/storage/jacket/marine/service/tanker)
	specialty = "vehicle crewman"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	item_state_slots = list(WEAR_BODY = "marine_tanker")

/obj/item/clothing/under/marine/officer/bridge
	name = "marine service uniform"
	desc = "Officer's uniform, a little outdated. Why it needs to be frag rated is beyond everyone."
	icon_state = "service_uniform"
	item_state = "service_uniform"
	worn_state = "service_uniform"
	specialty = "marine service"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer/boiler
	name = "\improper multi-branch operations boilersuit"
	desc = "A uniform favoured by those in the UA armed forces who are rarely on the field. Looks a little outdated."
	icon_state = "command_jumpsuit"
	item_state = "command_jumpsuit"
	worn_state = "command_jumpsuit"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer/qm_suit
	name = "logistics officer uniform"
	desc = "A nicely-fitting military uniform for a logistics officer, combining style & practicality. It has shards of light Kevlar to help protect against stabbing weapons and bullets."
	icon_state = "RO_jumpsuit"
	worn_state = "RO_jumpsuit"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer/cargo
	name = "support uniform"
	desc = "A pair of hard-wearing BDU pants & a short-sleeve breathable shirt. Perfect for those who work to support the frontline troops in various ways."
	icon_state = "cargotech"
	worn_state = "cargotech"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer/command
	name = "\improper USCM officer uniform"
	desc = "A USCMC commanding officer's uniform, custom cut for maximum comfort while staying within regulation."
	icon_state = "CO_jumpsuit"
	worn_state = "CO_jumpsuit"
	specialty = "USCM officer"

/obj/item/clothing/under/marine/officer/general
	name = "general uniform"
	desc = "A uniform worn by a fleet general. It comes in a shade of deep black, and has a light shimmer to it. The weave looks strong enough to provide some light protections."
	item_state = "general_jumpsuit"
	worn_state = "general_jumpsuit"
	specialty = "general"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer/ce
	name = "chief engineer uniform"
	desc = "The uniform of the chief engineer. Specially treated for hazardous conditions work, high density layers provide some level of radiation protection."
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	icon_state = "EC_jumpsuit"
	worn_state = "EC_jumpsuit"
	specialty = "chief engineer"
	flags_atom = NO_SNOW_TYPE
	item_state_slots = list(WEAR_BODY = "EC_jumpsuit")

/obj/item/clothing/under/marine/officer/engi
	name = "crew uniform"
	desc = "The uniform of a UA space-vessel crew member. Specially treated for hazardous materials handing and hostile conditions."
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad = CLOTHING_ARMOR_LOW
	icon_state = "mt_jumpsuit"
	worn_state = "mt_jumpsuit"
	specialty = "crew"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_SNOW_TYPE
	item_state_slots = list(WEAR_BODY = "mt_jumpsuit")

/obj/item/clothing/under/marine/officer/engi/OT
	name = "ordnance technician uniform"
	desc = "Ordinance technician's uniform. Improved protection from explosives and shrapnel provided by more extensive venlar coverage and hard bracing elements."
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	icon_state = "ot_jumpsuit"
	worn_state = "ot_jumpsuit"
	item_state_slots = list(WEAR_BODY = "ot_jumpsuit")

/obj/item/clothing/under/marine/officer/researcher
	name = "researcher clothes"
	desc = "A simple set of civilian clothes worn by researchers."
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad = CLOTHING_ARMOR_LOW
	icon_state = "research_jumpsuit"
	worn_state = "research_jumpsuit"
	specialty = "researcher"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer/formal/servicedress
	name = "commanding officer's dress shirt"
	desc = "The shirt and tie of a two-piece Navy service dress uniform for high-ranking officers. Wear with style and substance."
	specialty = "captain's service dress"
	icon_state = "CO_service"
	worn_state = "CO_service"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer/formal/white
	name = "Commanding Officer's white formal uniform"
	desc = "A well-ironed USCM officer uniform in brilliant white with gold accents, intended for parades or hot weather. Wear this with pride."
	icon_state = "CO_formal_white"
	worn_state = "CO_formal_white"
	specialty = "captain's white formal"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/officer/formal/black
	name = "Commanding Officer's gray formal uniform"
	desc = "A well-ironed USCM officer uniform in subdued gray with gold accents, intended for more formal or somber events. Wear this with pride."
	icon_state = "CO_formal_black"
	worn_state = "CO_formal_black"
	specialty = "captain's gray formal"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/dress
	name = "marine formal service uniform"
	desc = "A formal service uniform typically worn by marines of the USCM. Still practicable while still being more formal than the standard service uniform."
	icon_state = "formal_jumpsuit"
	worn_state = "formal_jumpsuit"
	specialty = "marine formal"
	flags_atom = NO_SNOW_TYPE
	flags_jumpsuit = FALSE
	black_market_value = 15

/obj/item/clothing/under/marine/dress/command
	name = "marine officer formal service uniform"
	desc = "A formal service uniform typically worn by marines of the USCM. Still practicable while still being more formal than the standard service uniform. This one belongs to an officer."
	icon_state = "formal_jumpsuit"
	worn_state = "formal_jumpsuit"
	specialty = "command formal"
	black_market_value = 20

//=========================//DRESS BLUES\\================================\\
//=======================================================================\\

/obj/item/clothing/under/marine/dress/blues
	name = "marine enlisted dress blues uniform"
	desc = "The undershirt and trousers of the legendary Marine dress blues, virtually unchanged since the 19th century. This unadorned variant is for enlisted personnel, E-1 thru E-3."
	icon = 'icons/mob/humans/onmob/contained/marinedressblues.dmi'
	icon_state = "enlisted"
	item_state = "enlisted"
	worn_state = "enlisted"
	contained_sprite = TRUE
	item_state_slots = null

/obj/item/clothing/under/marine/dress/blues/senior
	name = "marine senior dress blues uniform"
	desc = "The undershirt and trousers of the legendary Marine dress blues, virtually unchanged since the 19th century. This variant features the iconic Blood Stripe, worn by NCOs and officers."
	icon_state = "senior"
	item_state = "senior"
	worn_state = "senior"

/obj/item/clothing/under/marine/dress/blues/general
	name = "marine senior dress blues uniform"
	desc = "The undershirt and trousers of the legendary Marine dress blues, virtually unchanged since the 19th century. This variant features black trousers and a large Blood Stripe, worn by general officers."
	icon_state = "general"
	item_state = "general"
	worn_state = "general"

//=========================//PROVOST\\================================\\
//=======================================================================\\

/obj/item/clothing/under/marine/mp/provost
	flags_jumpsuit = FALSE
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

	name = "\improper Provost Uniform"
	desc = "The crisp uniform of a Provost Officer."
	icon_state = "provost"
	worn_state = "provost"
	specialty = "provost"

	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT

/obj/item/clothing/under/marine/mp/provost/senior
	name = "\improper Provost Senior Uniform"
	desc = "The crisp uniform of a senior member of the Provost Office."
	icon_state = "provost_tml"
	worn_state = "provost_tml"

/obj/item/clothing/under/marine/mp/provost/chief
	name = "\improper Provost Command Uniform"
	desc = "The crisp uniform of a commanding member of the Provost Office."
	icon_state = "provost_ci"
	worn_state = "provost_ci"

/obj/item/clothing/under/marine/mp/provost/marshal
	name = "\improper Provost Marshal Uniform"
	desc = "The crisp uniform of a Provost Marshal."
	icon_state = "provost_marshal"
	worn_state = "provost_marshal"

//=========================//USCM Survivors\\================================\\
//=======================================================================\\

/obj/item/clothing/under/marine/reconnaissance
	name = "\improper damaged USCM uniform"
	desc = "Torn, Burned and blood stained. This uniform has seen much more than you could possibly imagine."
	icon_state = "damage_marine_jumpsuit"
	worn_state = "damage_marine_jumpsuit"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/under/marine/reconnaissance/Initialize(mapload)
	. = ..()
	var/R = rand(1,4)
	switch(R) //this is no longer shitcode, courtesy of stan_albatross
		if(1)
			roll_suit_sleeves(FALSE)
		if(2)
			roll_suit_jacket(FALSE)
		if(3)
			cut_suit_jacket(FALSE)


//=========================//RESPONDERS\\================================\\
//=======================================================================\\

/obj/item/clothing/under/marine/veteran
	flags_jumpsuit = FALSE
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE //Let's make them keep their original name.

//=========================//Marine Raiders\\================================\\

/obj/item/clothing/under/marine/veteran/marsoc
	name = "black uniform"
	desc = "Black BDU utilized by USCM forces on night operations."
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	icon_state = "marsoc_jumpsuit"
	worn_state = "marsoc_jumpsuit"
	flags_item = NO_SNOW_TYPE

//=========================//PMC\\================================\\

/obj/item/clothing/under/marine/veteran/pmc
	name = "\improper PMC fatigues"
	desc = "A white set of fatigues, designed for private security operators. The symbol of the Weyland-Yutani corporation is emblazed on the suit."
	icon_state = "pmc_jumpsuit"
	worn_state = "pmc_jumpsuit"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	undershirt = TRUE

/obj/item/clothing/under/marine/veteran/pmc/leader
	name = "\improper PMC command fatigues"
	desc = "A white set of fatigues, designed for private security operators. The symbol of the Weyland-Yutani corporation is emblazed on the suit. This particular suit looks like it belongs to a high-ranking officer."
	icon_state = "officer_jumpsuit"
	worn_state = "officer_jumpsuit"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE

/obj/item/clothing/under/marine/veteran/pmc/commando
	name = "\improper PMC commando uniform"
	desc = "An armored uniform worn by Weyland-Yutani elite commandos. It is well protected while remaining light and comfortable."
	icon_state = "commando_jumpsuit"
	worn_state = "commando_jumpsuit"

/obj/item/clothing/under/marine/veteran/pmc/corporate
	name = "\improper WY corporate security uniform"
	desc = "An armored uniform worn by Weyland-Yutani corporate security members. This variant is commonly worn by what are known as 'goons'."
	icon = 'icons/mob/humans/onmob/contained/wy_goons.dmi'
	icon_state = "uniform"
	item_state = "uniform"
	worn_state = "uniform"
	contained_sprite = TRUE
	item_state_slots = null
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE

/obj/item/clothing/under/marine/veteran/pmc/corporate/lead
	desc = "An armored uniform worn by Weyland-Yutani corporate security members. This variant is commonly worn by the lead of the 'goonsquad', as they are colloquially known."
	icon_state = "lead_uniform"
	item_state = "lead_uniform"
	worn_state = "lead_uniform"

//=========================//UPP\\================================\\

/obj/item/clothing/under/marine/veteran/bear
	name = "\improper Iron Bear uniform"
	desc = "A uniform worn by Iron Bears mercenaries in the service of Mother Russia. Smells a little like an actual bear."
	icon_state = "bear_jumpsuit"
	worn_state = "bear_jumpsuit"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	has_sensor = UNIFORM_NO_SENSORS

	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/uniform_1.dmi',
	)

/obj/item/clothing/under/marine/veteran/UPP
	name = "\improper UPP fatigues"
	desc = "It's a set of standard-issue UPP Armed Collective combat fatigues featuring venlar armor inserts at critical areas to protect from blades and low caliber ballistics."
	icon_state = "upp_uniform"
	worn_state = "upp_uniform"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	has_sensor = UNIFORM_HAS_SENSORS
	sensor_faction = FACTION_UPP
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW

/obj/item/clothing/under/marine/veteran/UPP/boiler
	name = "\improper UPP operations boilersuit"
	desc = "It's a deep green boilersuit common with UPP Armed Collective personnel outside of combat zones but still featuring venlar armor inserts at critical areas to protect from blades and low caliber ballistics."
	icon_state = "upp_boiler"
	worn_state = "upp_boiler"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE

/obj/item/clothing/under/marine/veteran/UPP/pap
	name = "\improper PaP service uniform"
	desc = "A pair of blue-grey slacks coupled with a blue shirt, featuring venlar armor inserts at critical areas to protect from blades and low caliber ballistics."
	icon_state = "upp_uniform_pap"
	worn_state = "upp_uniform_pap"
	has_sensor = UNIFORM_HAS_SENSORS
	sensor_faction = FACTION_LIST_UPP_COLONY
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE

/obj/item/clothing/under/marine/veteran/UPP/service
	name = "\improper UPP service uniform"
	desc = "A pair of brown-green slacks coupled with a green shirt, featuring venlar armor inserts at critical areas to protect from blades and low caliber ballistics."
	icon_state = "upp_uniform_service"
	worn_state = "upp_uniform_service"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE

/obj/item/clothing/under/marine/veteran/UPP/naval
	name = "\improper UPP naval infantry uniform"
	flags_armor_protection = BODY_FLAG_GROIN|BODY_FLAG_LEGS
	desc = "A pair of black bell bottom naval pants matched with a blue telnyashka."
	icon_state = "upp_uniform_naval"
	worn_state = "upp_uniform_naval"
	flags_jumpsuit = UNIFORM_SLEEVE_CUT
	valid_accessory_slots = list(ACCESSORY_SLOT_UTILITY, ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_MEDAL, ACCESSORY_SLOT_UTILITY, ACCESSORY_SLOT_HOLSTER)


/obj/item/clothing/under/marine/veteran/canc
	name = "\improper CANC fatigues"
	desc = "It's a set of standard-issue CANC combat fatigues featuring venlar armor inserts at critical areas to protect from blades and low caliber ballistics."
	icon_state = "canc_uniform"
	worn_state = "canc_uniform"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	has_sensor = UNIFORM_HAS_SENSORS
	sensor_faction = FACTION_CANC
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW

//=========================//Freelancer\\================================\\

/obj/item/clothing/under/marine/veteran/freelancer
	name = "\improper freelancer fatigues"
	desc = "A set of loose-fitting fatigues, perfect for an informal mercenary. Smells like gunpowder, apple pie, and covered in grease and sake stains."
	icon_state = "freelancer_uniform"
	worn_state = "freelancer_uniform"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	has_sensor = UNIFORM_NO_SENSORS
	suit_restricted = list(/obj/item/clothing/suit/storage/marine/faction/freelancer, /obj/item/clothing/suit/storage/webbing, /obj/item/clothing/suit/storage/utility_vest)

//=========================//Dutch Dozen\\================================\\

/obj/item/clothing/under/marine/veteran/dutch
	name = "\improper Dutch's Dozen uniform"
	desc = "A comfortable uniform worn by the Dutch's Dozen mercenaries. It's seen some definite wear and tear, but is still in good condition."
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	icon_state = "dutch_jumpsuit"
	worn_state = "dutch_jumpsuit"
	has_sensor = UNIFORM_NO_SENSORS
	suit_restricted = list(/obj/item/clothing/suit/storage/marine/veteran/dutch, /obj/item/clothing/suit/armor/vest/dutch)


/obj/item/clothing/under/marine/veteran/dutch/ranger
	icon_state = "dutch_jumpsuit2"

/obj/item/clothing/under/marine/veteran/van_bandolier
	name = "hunting clothes"
	desc = "A set of tailored clothes, made from fine but sturdy reinforced fabrics. Protects from thorns, weather, and the cuts and scrapes that forever bedevil outdoorsmen."
	icon_state = "van_bandolier"
	worn_state = "van_bandolier"
	item_state = "van_bandolier_clothes"
	flags_cold_protection = ICE_PLANET_MIN_COLD_PROT
	has_sensor = UNIFORM_NO_SENSORS

//=========================//OWLF\\================================\\

/obj/item/clothing/under/marine/veteran/owlf
	name = "\improper OWLF thermal field uniform"
	desc = "A high-tech uniform with built-in thermal cloaking technology. It looks like it's worth more than your life."
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS //This is all a copy and paste of the Dutch's stuff for now.
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_LEGS
	icon_state = "owlf_uniform"
	worn_state = "owlf_uniform"
	has_sensor = UNIFORM_NO_SENSORS
	hood_state = /obj/item/clothing/head/owlf_hood

//===========================//HELGHAST - MERCENARY\\================================\\
//=====================================================================\\

/obj/item/clothing/under/marine/veteran/mercenary
	name = "\improper Mercenary fatigues"
	desc = "A thick, beige suit with a red armband. There is an unknown symbol is emblazed on the suit."
	icon_state = "mercenary_heavy_uniform"
	worn_state = "mercenary_heavy_uniform"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	suit_restricted = list(/obj/item/clothing/suit/storage/marine/veteran/mercenary)

/obj/item/clothing/under/marine/veteran/mercenary/miner
	name = "\improper Mercenary miner fatigues"
	desc = "A beige suit with a red armband. It looks a little thin, like it wasn't designed for protection. There is an unknown symbol is emblazed on the suit."
	icon_state = "mercenary_miner_uniform"
	worn_state = "mercenary_miner_uniform"

/obj/item/clothing/under/marine/veteran/mercenary/support
	name = "\improper Mercenary engineer fatigues"
	desc = "A blue suit with yellow accents, used by engineers. There is an unknown symbol is emblazed on the suit."
	icon_state = "mercenary_engineer_uniform"
	worn_state = "mercenary_engineer_uniform"


////// Civilians /////////

/obj/item/clothing/under/marine/ua_riot
	name = "\improper United American security uniform"
	desc = "Overalls made of kevlon cover a snazzy blue dress shirt. UA branded security uniforms are notorious for their association with anti-union riot control teams."
	icon_state = "ua_riot"
	worn_state = "ua_riot"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE //Let's make them keep their original name.
	flags_jumpsuit = FALSE
	suit_restricted = null

/obj/item/clothing/under/marine/ucf_clown
	name = "\improper UCF uniform"
	desc = "A Unified Clown Federation combat uniform. Features the latest in anti-mime technology."
	icon_state = "clown"
	worn_state = "clown"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE //Let's make them keep their original name.
	black_market_value = 25

/obj/item/clothing/under/pizza
	name = "pizza delivery uniform"
	desc = "An ill-fitting, slightly stained uniform for a pizza delivery pilot. Smells of cheese."
	icon_state = "redshirt2"
	item_state = "r_suit"
	worn_state = "redshirt2"
	has_sensor = UNIFORM_NO_SENSORS

/obj/item/clothing/under/souto
	name = "\improper Souto Man's cargo pants"
	desc = "The white cargo pants worn by the one and only Souto man. As cool as an ice cold can of Souto Grape!"
	icon_state = "souto_man"
	worn_state = "souto_man"
	has_sensor = UNIFORM_NO_SENSORS

/obj/item/clothing/under/colonist
	name = "abstract colonist"
	desc = "Don't spawn this!"
	has_sensor = UNIFORM_HAS_SENSORS
	sensor_faction = FACTION_COLONIST

/obj/item/clothing/under/colonist/workwear
	name = "grey workwear"
	desc = "A pair of black slacks and a short-sleeve grey workshirt. Standard uniform for Weyland Yutani employees working in colony operations and administration."
	icon_state = "workwear_grey"
	worn_state = "workwear_grey"

/obj/item/clothing/under/colonist/workwear/khaki
	name = "khaki workwear"
	desc = "A pair of jeans paired with a khaki workshirt. A common pairing among blue-collar workers due to its drab look."
	icon_state = "workwear_khaki"
	worn_state = "workwear_khaki"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE

/obj/item/clothing/under/colonist/workwear/pink
	name = "pink workwear"
	desc = "A pair of jeans paired with a pink workshirt. Pink? Your wife might not think so, but such outlandish attire deserves questioning by corporate security. What are you, some kind of free-thinking anarchist?"
	icon_state = "workwear_pink"
	worn_state = "workwear_pink"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE

/obj/item/clothing/under/colonist/workwear/blue
	name = "blue workwear"
	desc = "A pair of brown canvas workpants paired with a dark blue workshirt. A common pairing among blue-collar workers."
	icon_state = "workwear_blue"
	worn_state = "workwear_blue"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE

/obj/item/clothing/under/colonist/workwear/green
	name = "green workwear"
	desc = "A pair of brown canvas workpants paired with a green workshirt. An common pairing among blue-collar workers."
	icon_state = "workwear_green"
	worn_state = "workwear_green"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE

/obj/item/clothing/under/colonist/boilersuit
	name = "light-blue boilersuit"
	desc = "A light-blue boilersuit."
	icon_state = "boilersuit_lightblue"
	worn_state = "boilersuit_lightblue"
	flags_jumpsuit = UNIFORM_JACKET_REMOVABLE

/obj/item/clothing/under/colonist/boilersuit/darkblue
	name = "dark-blue boilersuit"
	desc = "A dark-blue boilersuit."
	icon_state = "boilersuit_darkblue"
	worn_state = "boilersuit_darkblue"

/obj/item/clothing/under/colonist/boilersuit/khaki
	name = "khaki boilersuit"
	desc = "A khaki boilersuit."
	icon_state = "boilersuit_khaki"
	worn_state = "boilersuit_khaki"

/obj/item/clothing/under/colonist/boilersuit/white
	name = "white boilersuit"
	desc = "An off-white boilersuit."
	icon_state = "boilersuit_white"
	worn_state = "boilersuit_white"

/obj/item/clothing/under/colonist/boilersuit/cyan
	name = "cyan boilersuit"
	desc = "A cyan boilersuit."
	icon_state = "boilersuit_cyan"
	worn_state = "boilersuit_cyan"

/obj/item/clothing/under/colonist/boilersuit/grey
	name = "grey boilersuit"
	desc = "A grey boilersuit."
	icon_state = "boilersuit_steel"
	worn_state = "boilersuit_steel"

/obj/item/clothing/under/colonist/clf
	name = "\improper Colonial Liberation Front uniform"
	desc = "A stylish grey-green jumpsuit - standard issue for colonists. This version appears to have the symbol of the Colonial Liberation Front emblazoned in select areas."
	icon_state = "clf_uniform"
	worn_state = "clf_uniform"
	sensor_faction = FACTION_CLF

/obj/item/clothing/under/colonist/prison_boiler
	name = "\improper prisoner boiler uniform"
	desc = "A standardised prisoner-wear boiler uniform."
	icon_state = "prison_boiler"
	worn_state = "prison_boiler"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE

/obj/item/clothing/under/colonist/ua_civvies
	name = "\improper UA gray utility uniform"
	desc = "A stylish gray jumpsuit - standard issue for UA civilian support personnel."
	icon_state = "ua_civvies"
	worn_state = "ua_civvies"
	has_sensor = UNIFORM_HAS_SENSORS
	sensor_faction = FACTION_MARINE

/obj/item/clothing/under/colonist/wy_davisone
	name = "\improper UA brown utility uniform"
	desc = "A stylish brown jumpsuit - standard issue for UA civilian support personnel."
	icon_state = "wy_davisone"
	worn_state = "wy_davisone"
	has_sensor = UNIFORM_HAS_SENSORS
	sensor_faction = FACTION_MARINE

/obj/item/clothing/under/colonist/white_service
	name = "white service uniform"
	desc = "A white dress shirt and tie with sleek pants. Standard clothing for anyone on professional business."
	icon_state = "CO_service"
	worn_state = "CO_service"
	has_sensor = UNIFORM_HAS_SENSORS
	sensor_faction = FACTION_MARINE

/obj/item/clothing/under/colonist/wy_joliet_shopsteward
	name = "steward utilities"
	desc = "A stylish brown vest and shorts - uniforms like this are often worn by clerks and shop stewards."
	icon_state = "wy_joliet_shopsteward"
	worn_state = "wy_joliet_shopsteward"
	has_sensor = UNIFORM_HAS_SENSORS
	sensor_faction = FACTION_MARINE

/obj/item/clothing/under/tshirt
	name = "T-shirt parent object"
	has_sensor = UNIFORM_NO_SENSORS

/obj/item/clothing/under/tshirt/w_br
	name = "white T-shirt and brown pants"
	desc = "A comfortable white T-shirt and brown jeans."
	icon_state = "tshirt_w_br"
	worn_state = "tshirt_w_br"
	displays_id = FALSE
	has_sensor = UNIFORM_HAS_SENSORS
	sensor_faction = FACTION_MARINE

/obj/item/clothing/under/tshirt/gray_blu
	name = "gray T-shirt and jeans"
	desc = "A comfortable gray T-shirt and blue jeans."
	icon_state = "tshirt_gray_blu"
	worn_state = "tshirt_gray_blu"
	displays_id = FALSE
	has_sensor = UNIFORM_HAS_SENSORS
	sensor_faction = FACTION_MARINE

/obj/item/clothing/under/tshirt/r_bla
	name = "red T-shirt and black pants"
	desc = "A comfortable red T-shirt and black jeans."
	icon_state = "tshirt_r_bla"
	worn_state = "tshirt_r_bla"
	displays_id = FALSE
	has_sensor = UNIFORM_HAS_SENSORS
	sensor_faction = FACTION_MARINE

/obj/item/clothing/under/cmb
	name = "\improper Colonial Marshal uniform"
	desc = "A pair of off-white slacks and a blue button-down shirt with a dark brown tie; the standard uniform of the Colonial Marshals."
	icon_state = "marshal"
	worn_state = "marshal"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_JACKET_REMOVABLE

/obj/item/clothing/under/liaison_suit
	name = "liaison's tan suit"
	desc = "A stiff, stylish tan suit commonly worn by businessmen from the Weyland-Yutani corporation. Expertly crafted to make you look like a prick."
	icon_state = "liaison_regular"
	worn_state = "liaison_regular"

/obj/item/clothing/under/liaison_suit/charcoal
	name = "liaison's charcoal suit"
	desc = "A stiff, stylish charcoal suit commonly worn by businessmen from the Weyland-Yutani corporation. Expertly crafted to make you look like a prick."
	icon_state = "liaison_charcoal"
	worn_state = "liaison_charcoal"

/obj/item/clothing/under/liaison_suit/outing
	name = "liaison's outfit"
	desc = "A casual outfit consisting of a collared shirt and a vest. Looks like something you might wear on the weekends, or on a visit to a derelict colony."
	icon_state = "liaison_outing"
	worn_state = "liaison_outing"

/obj/item/clothing/under/liaison_suit/outing/red
	icon_state = "liaison_outing_red"
	worn_state = "liaison_outing_red"

/obj/item/clothing/under/liaison_suit/formal
	name = "liaison's white suit"
	desc = "A formal, white suit. Looks like something you'd wear to a funeral, a Weyland-Yutani corporate dinner, or both. Stiff as a board, but makes you feel like rolling out of a Rolls-Royce."
	icon_state = "liaison_formal"
	worn_state = "liaison_formal"

/obj/item/clothing/under/liaison_suit/suspenders
	name = "liaison's suspenders"
	desc = "A collared shirt, complimented by a pair of suspenders. Worn by Weyland-Yutani employees who ask the tough questions. Smells faintly of cigars and bad acting."
	icon_state = "liaison_suspenders"
	worn_state = "liaison_suspenders"

/obj/item/clothing/under/liaison_suit/blazer
	name = "liaison's blue blazer"
	desc = "A stiff but casual blue blazer. Similar can be found in any Weyland-Yutani office. Only the finest wear for the galaxy's most cunning."
	icon_state = "liaison_blue_blazer"
	worn_state = "liaison_blue_blazer"

/obj/item/clothing/under/liaison_suit/field
	name = "corporate casual"
	desc = "A pair of dark brown slacks paired with a dark blue button-down shirt. A popular look among those in the corporate world that conduct the majority of their business from night clubs."
	icon_state = "corporate_field"
	worn_state = "corporate_field"

/obj/item/clothing/under/liaison_suit/ivy
	name = "country club outfit"
	desc = "A pair of khaki slacks paired with a light blue button-down shirt. A popular look with those in the corporate world that conduct the majority of their business from country clubs."
	icon_state = "corporate_ivy"
	worn_state = "corporate_ivy"

/obj/item/clothing/under/liaison_suit/orange
	name = "orange outfit"
	desc = "A pair of black pants paired with a very Wey-Yu orange shirt. A popular look with those in the corporate world that conduct the majority of their business from Weyland Yutani offices."
	icon_state = "corporate_orange"
	worn_state = "corporate_orange"

/obj/item/clothing/under/liaison_suit/corporate_formal
	name = "white suit pants"
	desc = "A pair of ivory slacks paired with a white shirt. A popular pairing for formal corporate events."
	icon_state = "corporate_formal"
	worn_state = "corporate_formal"

/obj/item/clothing/under/liaison_suit/black
	name = "black suit pants"
	desc = "A pair of black slacks paired with a white shirt. The most common pairing among corporate workers."
	icon_state = "corporate_black"
	worn_state = "corporate_black"

/obj/item/clothing/under/liaison_suit/brown
	name = "brown suit pants"
	desc = "A pair of brown slacks paired with a white shirt. A common pairing among corporate workers."
	icon_state = "corporate_brown"
	worn_state = "corporate_brown"

/obj/item/clothing/under/liaison_suit/blue
	name = "blue suit pants"
	desc = "A pair of blue slacks paired with a white shirt. A common pairing among corporate workers."
	icon_state = "corporate_blue"
	worn_state = "corporate_blue"

/obj/item/clothing/under/liaison_suit/grey
	name = "grey suit pants"
	desc = "A pair of grey slacks paired with a white shirt. A common pairing among corporate workers."
	icon_state = "corporate_grey"
	worn_state = "corporate_grey"

/obj/item/clothing/under/liaison_suit/khaki
	name = "khaki suit pants"
	desc = "A pair of khaki slacks paired with a white shirt. A common pairing among corporate workers."
	icon_state = "corporate_khaki"
	worn_state = "corporate_khaki"

/obj/item/clothing/under/marine/reporter
	name = "combat correspondent uniform"
	desc = "A relaxed and robust uniform fit for any potential reporting needs."
	icon_state = "cc_white"
	worn_state = "cc_white"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/uniform_1.dmi',
	)

/obj/item/clothing/under/marine/reporter/black
	icon_state = "cc_black"
	worn_state = "cc_black"

/obj/item/clothing/under/marine/reporter/orange
	icon_state = "cc_orange"
	worn_state = "cc_orange"

/obj/item/clothing/under/marine/reporter/red
	icon_state = "cc_red"
	worn_state = "cc_red"

/obj/item/clothing/under/twe_suit
	name = "representative's fine suit"
	desc = "A stiff, stylish blue suit commonly worn by gentlemen from the Three World Empire. Expertly crafted to make you look as important as possible."
	icon_state = "twe_suit"
	worn_state = "twe_suit"

/obj/item/clothing/under/stowaway
	name = "dirty suit"
	desc = "A stiff, stylish tan suit commonly worn by businessmen from the Weyland-Yutani corporation. Expertly crafted to make you look like a prick."
	icon_state = "stowaway_uniform"
	worn_state = "stowaway_uniform"

/obj/item/clothing/under/rank/chef/exec
	name = "\improper Weyland-Yutani suit"
	desc = "A formal white undersuit."
	flags_jumpsuit = FALSE

/obj/item/clothing/under/rank/synthetic
	name = "\improper USCM Support Uniform"
	desc = "A simple uniform made for Synthetic crewmembers."
	icon_state = "rdalt"
	worn_state = "rdalt"
	flags_jumpsuit = FALSE

/obj/item/clothing/under/rank/synthetic/frontier
	name = "\improper frontier jumpsuit"
	desc = "A cargo jumpsuit dressed down for full range of motion and state-of-the-art frontier temperature control. It's the best thing an engineer can wear in the Outer Veil."
	icon_state = "synth_cargo_light"
	worn_state = "synth_cargo_light"
	displays_id = FALSE

/obj/item/clothing/under/rank/synthetic/utility
	name = "\improper UA utility uniform"
	desc = "A green-on-green utility uniform, popularly issued to UA contract workers on the frontier."
	icon_state = "synth_green_utility"
	worn_state = "synth_green_utility"
	displays_id = FALSE

/obj/item/clothing/under/rank/synthetic/utility/yellow
	name = "\improper utility uniform"
	desc = "A grey utility uniform with yellow suspenders, made for shipside crew."
	icon_state = "synth_yellow_utility"
	worn_state = "synth_yellow_utility"

/obj/item/clothing/under/rank/synthetic/utility/red
	name = "\improper utility uniform"
	desc = "A grey utility uniform with red suspenders and blue jeans, the sign of a veteran laborer, or someone not paid by the hour."
	icon_state = "synth_red_utility"
	worn_state = "synth_red_utility"

/obj/item/clothing/under/rank/synthetic/utility/blue
	name = "\improper utility uniform"
	desc = "A blue utility uniform with teal suspenders and rugged pants."
	icon_state = "synth_blue_utility"
	worn_state = "synth_blue_utility"

/obj/item/clothing/under/rank/synthetic/councillor
	name = "\improper USCM Pristine Support Uniform"
	desc = "A nicely handcrafted uniform made for Synthetic crewmembers."
	icon_state = "synth_councillor"
	worn_state = "synth_councillor"
	displays_id = FALSE

/obj/item/clothing/under/rank/synthetic/flight
	name = "tactical flightsuit"
	desc = "A flightsuit with plenty of leather straps, pouches, and other essential gear."
	icon_state = "pilot_flightsuit_alt"
	item_state = "pilot_flightsuit_alt"
	worn_state = "pilot_flightsuit_alt"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	flags_cold_protection = ICE_PLANET_MIN_COLD_PROT

/obj/item/clothing/under/rank/synthetic/old
	icon_state = "rdalt_s"
	worn_state = "rdalt_s"

/obj/item/clothing/under/rank/synthetic/joe
	name = "\improper Working Joe Uniform"
	desc = "A cheap uniform made for Synthetic labor. Tomorrow, Together."
	icon_state = "working_joe"
	worn_state = "working_joe"
	flags_item = NO_CRYO_STORE
	var/obj/structure/machinery/camera/camera

/obj/item/clothing/under/rank/synthetic/joe/Initialize()
	. = ..()
	camera = new /obj/structure/machinery/camera/autoname/almayer/containment/ares(src)

/obj/item/clothing/under/rank/synthetic/joe/Destroy()
	QDEL_NULL(camera)
	return ..()

/obj/item/clothing/under/rank/synthetic/joe/equipped(mob/living/carbon/human/mob, slot)
	if(camera)
		camera.c_tag = mob.name
	..()

/obj/item/clothing/under/rank/synthetic/joe/dropped(mob/living/carbon/human/mob)
	if(camera)
		camera.c_tag = "3RR0R"
	..()

/obj/item/clothing/under/rank/synthetic/joe/get_examine_text(mob/user)
	. = ..()
	if(camera)
		. += SPAN_ORANGE("There is a small camera mounted to the front.")

/obj/item/clothing/under/rank/synthetic/joe/engi
	name = "\improper Working Joe Hazardous Uniform"
	desc = "A reinforced uniform used for Synthetic labor in hazardous areas. Tomorrow, Together."
	icon_state = "working_joe_engi"
	worn_state = "working_joe_engi"
	flags_inventory = CANTSTRIP
	armor_melee = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_HIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE

/obj/item/clothing/under/rank/synthetic/joe/engi/overalls
	name = "\improper Working Joe Hazardous Uniform"
	desc = "A reinforced uniform used for Synthetic labor in hazardous areas. Comes with an additional layer for liquid hazards. Tomorrow, Together."
	icon_state = "working_joe_overalls"
	worn_state = "working_joe_overalls"
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	unacidable = TRUE

//=ROYAL MARINES=\\

/obj/item/clothing/under/marine/veteran/royal_marine
	name = "royal marines commando uniform"
	desc = "The field uniform of the royal marines commando. They have shards of light Kevlar to help protect against stabbing weapons and bullets. Onpar with similar USCM equipment."
	icon_state = "rmc_uniform"
	worn_state = "rmc_uniform"
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	contained_sprite = TRUE
	icon = 'icons/mob/humans/onmob/contained/royal_marines_commando.dmi'

/obj/item/clothing/under/marine/veteran/royal_marine/tl
	icon_state = "rmc_uniform_teaml"
	worn_state = "rmc_uniform_teaml"

/obj/item/clothing/under/marine/veteran/royal_marine/lt
	name = "royal marines commando officers uniform"
	desc = "The officers uniform of the royal marines commando. They have shards of light Kevlar to help protect against stabbing weapons and bullets. Onpar with similar USCM equipment."
	icon_state = "rmc_uniform_lt"
	worn_state = "rmc_uniform_lt"

/obj/item/clothing/under/marine/pve_mopp
	name = "\improper M2 MOPP suit"
	desc = "M2 MOPP suits are purpose built to defend the wearer against biological and radioactive contaminants, from nerve gas to nuclear fallout."
	desc_lore = "The several-paragraph long expository pamphlet that usually comes with these is missing."
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	flags_jumpsuit = NO_FLAGS
	icon_state = "cbrn"
	worn_state = "cbrn"

	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/uniform_1.dmi',
	)


/obj/item/clothing/under/marine/cbrn //CBRN MOPP suit
	name = "\improper M3 MOPP suit"
	desc = "M3 MOPP suits are specially designed and engineered to protect the wearer from unshielded exposure to any Chemical, Biological, Radiological, or Nuclear (CBRN) threats in the field. The suit has a recommended lifespan of twenty-four hours once contact with a toxic environment is made, but depending on the severity this can be shortened to eight hours or less."
	desc_lore = "Since the outbreak of the New Earth Plague in 2157 and the subsequent Interstellar Commerce Commission (ICC) sanctioned decontamination of the colony and its 40 million inhabitants, the abandoned colony has been left under a strict quarantine blockade to prevent any potential scavengers from spreading what’s left of the highly-durable airborne flesh-eating bacteria. Following those events, the three major superpowers have been investing heavily in the development and procurement of CBRN equipment, in no small part due to the extensive damage that the plague and other similar bioweapons could do. The \"Marine 70\" upgrade package and the launch of the M3 pattern armor series saw the first M3-M prototypes approved for CBRN usage."
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	icon_state = "cbrn"
	worn_state = "cbrn"
	flags_jumpsuit = NO_FLAGS
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_VERYLOW
	armor_bio = CLOTHING_ARMOR_HIGH
	armor_rad = CLOTHING_ARMOR_HIGHPLUS
	fire_intensity_resistance = BURN_LEVEL_TIER_1
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROT
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	flags_heat_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	actions_types = list(/datum/action/item_action/specialist/toggle_cbrn_hood)

	item_icons = list(
		WEAR_BODY = 'icons/mob/humans/onmob/uniform_1.dmi',
	)

	///Whether the hood and gas mask were worn through the hood toggle verb
	var/hood_enabled = FALSE
	///Whether enabling the hood protects you from fire
	var/supports_fire_protection = TRUE
	///Typepath of the attached hood
	var/hood_type = /obj/item/clothing/head/helmet/marine/cbrn_hood
	///The head clothing that the suit uses as a hood
	var/obj/item/clothing/head/linked_hood

/obj/item/clothing/under/marine/cbrn/Initialize()
	linked_hood = new hood_type(src)
	. = ..()

/obj/item/clothing/under/marine/cbrn/Destroy()
	. = ..()
	if(linked_hood)
		qdel(linked_hood)

/obj/item/clothing/under/marine/cbrn/verb/hood_toggle()
	set name = "Toggle Hood"
	set desc = "Pull your hood and gasmask up over your face and head."
	set src in usr
	if(!usr || usr.is_mob_incapacitated(TRUE))
		return
	if(!ishuman(usr))
		return
	var/mob/living/carbon/human/user = usr

	if(user.w_uniform != src)
		to_chat(user, SPAN_WARNING("You must be wearing [src] to put on [linked_hood] attached to it!"))
		return

	if(!linked_hood)
		to_chat(user, SPAN_BOLDWARNING("You are missing a linked_hood! This should not be possible."))
		CRASH("[user] attempted to toggle hood on [src] that was missing a linked_hood.")

	playsound(user.loc, "armorequip", 25, 1)
	if(hood_enabled)
		disable_hood(user, FALSE)
		return
	enable_hood(user)

/obj/item/clothing/under/marine/cbrn/proc/enable_hood(mob/living/carbon/human/user)
	if(!istype(user))
		user = usr

	if(!linked_hood.mob_can_equip(user, WEAR_HEAD))
		to_chat(user, SPAN_WARNING("You are unable to equip [linked_hood]."))
		return

	user.equip_to_slot(linked_hood, WEAR_HEAD)

	hood_enabled = TRUE
	RegisterSignal(src, COMSIG_ITEM_UNEQUIPPED, PROC_REF(disable_hood))
	RegisterSignal(linked_hood, COMSIG_ITEM_UNEQUIPPED, PROC_REF(disable_hood))

	if(!supports_fire_protection)
		return
	to_chat(user, SPAN_NOTICE("You raise [linked_hood] over your head. You will no longer catch fire."))
	toggle_fire_protection(user, TRUE)

/obj/item/clothing/under/marine/cbrn/proc/disable_hood(mob/living/carbon/human/user, forced = TRUE)
	if(!istype(user))
		user = usr

	UnregisterSignal(src, COMSIG_ITEM_UNEQUIPPED)
	UnregisterSignal(linked_hood, COMSIG_ITEM_UNEQUIPPED)
	addtimer(CALLBACK(user, TYPE_PROC_REF(/mob/living/carbon/human, drop_inv_item_to_loc), linked_hood, src), 1) //0.1s delay cause you can grab the hood
	addtimer(CALLBACK(src, PROC_REF(check_remove_headgear)), 2) //Checks if it is still not in contents, incase it was dropped

	hood_enabled = FALSE
	if(!forced)
		to_chat(user, SPAN_NOTICE("You take off [linked_hood]."))

	if(supports_fire_protection)
		toggle_fire_protection(user, FALSE)

/obj/item/clothing/under/marine/cbrn/proc/check_remove_headgear(obj/item/clothing/under/marine/cbrn/uniform = src)
	for(var/current_atom in contents)
		if(current_atom == linked_hood)
			return
	linked_hood.forceMove(uniform)

/obj/item/clothing/under/marine/cbrn/proc/toggle_fire_protection(mob/living/carbon/user, enable_fire_protection)
	if(enable_fire_protection)
		RegisterSignal(user, COMSIG_LIVING_PREIGNITION, PROC_REF(fire_shield_is_on))
		RegisterSignal(user, list(COMSIG_LIVING_FLAMER_CROSSED, COMSIG_LIVING_FLAMER_FLAMED), PROC_REF(flamer_fire_callback))
		return
	UnregisterSignal(user, list(COMSIG_LIVING_PREIGNITION, COMSIG_LIVING_FLAMER_CROSSED, COMSIG_LIVING_FLAMER_FLAMED))

/obj/item/clothing/under/marine/cbrn/proc/fire_shield_is_on(mob/living/burning_mob) //Stealing it from the pyro spec armor
	SIGNAL_HANDLER

	if(burning_mob.fire_reagent?.fire_penetrating)
		return

	return COMPONENT_CANCEL_IGNITION

/obj/item/clothing/under/marine/cbrn/proc/flamer_fire_callback(mob/living/burning_mob, datum/reagent/fire_reagent)
	SIGNAL_HANDLER

	if(fire_reagent.fire_penetrating)
		return

	. = COMPONENT_NO_IGNITE|COMPONENT_NO_BURN

/datum/action/item_action/specialist/toggle_cbrn_hood
	ability_primacy = SPEC_PRIMARY_ACTION_2

/datum/action/item_action/specialist/toggle_cbrn_hood/New(obj/item/clothing/under/marine/cbrn/armor, obj/item/holder)
	..()
	name = "Toggle Hood"
	button.name = name
	button.overlays.Cut()
	var/image/button_overlay = image(armor.linked_hood.icon, armor, armor.linked_hood.icon_state)
	button.overlays += button_overlay

/datum/action/item_action/specialist/toggle_cbrn_hood/action_activate()
	. = ..()
	var/obj/item/clothing/under/marine/cbrn/armor = holder_item
	if(!istype(armor))
		return
	armor.hood_toggle()

/obj/item/clothing/under/marine/cbrn/advanced
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_HIGHPLUS
	armor_bio = CLOTHING_ARMOR_GIGAHIGHPLUS
	armor_rad = CLOTHING_ARMOR_GIGAHIGHPLUS
	armor_internaldamage = CLOTHING_ARMOR_HIGHPLUS
	hood_type = /obj/item/clothing/head/helmet/marine/cbrn_hood/advanced

//=USASF & ARMY=\\

/obj/item/clothing/under/navy/officer
	name = "\improper duty officer uniform"
	desc = "The uniform of a duty officer in the USASF. Specially treated for hazardous conditions work, high density layers provide some level of radiation protection."
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	icon_state = "boilersuit_khaki"
	worn_state = "boilersuit_khaki"
	suit_restricted = null //so most officers can wear whatever suit they want
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	item_state_slots = list(WEAR_BODY = "boilersuit_khaki")

/obj/item/clothing/under/navy/tech
	name = "\improper engineering technician uniform"
	desc = "The uniform of an engineering technician. Specially treated for hazardous materials handing and hostile conditions, with reinforced material around the elbows and knees."
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	icon_state = "mt_jumpsuit"
	worn_state = "mt_jumpsuit"
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	item_state_slots = list(WEAR_BODY = "mt_jumpsuit")

/obj/item/clothing/under/marine/standard/navy
	name = "\improper USASF combat uniform"
	icon_state = "navy_jumpsuit"
	item_state = "navy_jumpsuit"
	worn_state = "navy_jumpsuit"
	desc = "Standard-issue USASF Security Forces uniform in a distintive blue steel color scheme, complete with venlar armor inserts at critical areas to protect from blades and ballistics."
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/under/marine/officer/engi/OT/navy
	name = "\improper damage-control crew uniform"
	desc = "The uniform of an aerospace force crewman. Specially treated for hazardous materials handing and hostile conditions. This one has the color-flashes of a member of the ship damage-control teams on it."
	icon_state = "ot_jumpsuit"
	worn_state = "ot_jumpsuit"
	item_state_slots = list(WEAR_BODY = "ot_jumpsuit")
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/under/marine/officer/engi/navy/tech
	name = "\improper engineering technician uniform"
	desc = "The uniform of an aerospace force engineering technician. Specially treated for hazardous materials handing and hostile conditions, with reinforced material around the elbows and knees."
	icon_state = "boilersuit_darkblue"
	worn_state = "boilersuit_darkblue"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/under/marine/officer/pilot/flight/para
	name = "\improper para-rescue flightsuit"
	desc = "A flightsuit worn by the elite para-rescue forces of the USASF, with all the necessary straps and rigging for supporting the sheer balls these servicemen have. Looks badass."
	suit_restricted = null
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/under/marine/officer/intel/navy
	name = "\improper USASF combat uniform"
	desc = "Forward-observation work is dangerous, but it's slightly less dangerous when your duty uniform can almost stop a bullet. Also features many pockets and attachment points for all storage needs."
	icon_state = "jfo"
	item_state = "jfo"
	worn_state = "jfo"
	suit_restricted = null
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/under/marine/standard/army
	name = "\improper army combat uniform"
	icon_state = "army_jumpsuit"
	item_state = "army_jumpsuit"
	worn_state = "army_jumpsuit"
	desc = "Standard-issue Army uniform in a two-tone desert/temperate color scheme, complete with venlar armor inserts at critical areas to protect from blades and ballistics."
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

