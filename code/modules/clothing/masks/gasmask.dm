
/obj/item/clothing/mask/gas
	name = "gas mask"
	desc = "A civilian grade, face-covering mask that can be connected to an air supply. Filters harmful gases from the air."
	icon_state = "gas_alt"
	flags_inventory = COVERMOUTH | COVEREYES | ALLOWINTERNALS | BLOCKGASEFFECT | ALLOWREBREATH | ALLOWCPR
	flags_inv_hide = HIDEEARS|HIDEFACE|HIDELOWHAIR
	flags_cold_protection = BODY_FLAG_HEAD
	flags_equip_slot = SLOT_FACE|SLOT_WAIST
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	w_class = SIZE_SMALL
	item_state = "gas_alt"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.9
	armor_melee = CLOTHING_ARMOR_NONE
	armor_bullet = CLOTHING_ARMOR_NONE
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_NONE
	siemens_coefficient = 0.9
	vision_impair = VISION_IMPAIR_NONE
	var/gas_filter_strength = 1 //For gas mask filters
	var/list/filtered_gases = list("phoron", "sleeping_agent", "carbon_dioxide")

/obj/item/clothing/mask/gas/kutjevo
	name = "kutjevo respirator"
	desc = "A respirator worn on the face that filters out harmful air particles often present in the air of Kutjevo."
	icon_state = "kutjevo_respirator"
	item_state = "kutjevo_respirator"

/obj/item/clothing/mask/gas/military
	name = "\improper M5 gasmask"
	desc = "The standard service gas mask of the USCM as part of a modernization program meant to replace the need for MOPP gear."
	icon_state = "m5"
	item_state = "m5"
	flags_obj = OBJ_NO_HELMET_BAND|OBJ_IS_HELMET_GARB
	flags_inv_hide = HIDEEARS|HIDEFACE|HIDEALLHAIR

/obj/item/clothing/mask/gas/military/on_enter_storage(obj/item/storage/internal/helmet_internal_inventory)
	..()
	if(!istype(helmet_internal_inventory))
		return
	var/obj/item/clothing/head/helmet/helmet_item = helmet_internal_inventory.master_object

	if(!istype(helmet_item))
		return

	helmet_item.flags_inventory |= BLOCKGASEFFECT
	helmet_item.flags_inv_hide |= HIDEFACE

/obj/item/clothing/mask/gas/military/on_exit_storage(obj/item/storage/internal/helmet_internal_inventory)
	..()
	if(!istype(helmet_internal_inventory))
		return
	var/obj/item/clothing/head/helmet/helmet_item = helmet_internal_inventory.master_object

	if(!istype(helmet_item))
		return

	helmet_item.flags_inventory &= ~(BLOCKGASEFFECT)
	helmet_item.flags_inv_hide &= ~(HIDEFACE)

/obj/item/clothing/mask/gas/military/upp
	name = "\improper ShMB/4 gasmask"
	desc = "The standard issue gasmask utilized by the UPP Armed Collective and many UPP civilian organizations."
	icon_state = "pfb"
	item_state = "pfb"

/obj/item/clothing/mask/gas/pve_mopp
	name = "\improper M2 MOPP mask"
	desc = "The M2 MOPP mask includes a full covering cowl that securely attaches to the MOPP suit. It is capable of protecting of a variety of radiological and biological threats."
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	icon_state = "cbrn_hood"
	item_state = "cbrn_hood"
	flags_inv_hide = HIDEEARS|HIDEFACE|HIDEALLHAIR
	item_icons = list(
		WEAR_FACE = 'icons/mob/humans/onmob/head_1.dmi'
	)

/obj/item/clothing/mask/gas/pmc
	name = "\improper tactical filtration mask"
	desc = "A sophisticated filtration mask being tested for the military market but presently limited to Weyland-Yutani tactical teams."
	item_state = "helmet"
	icon_state = "pmc_mask"
	anti_hug = 3
	vision_impair = VISION_IMPAIR_NONE
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_NONE
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_HIGH
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_NONE
	flags_inventory = COVERMOUTH|ALLOWINTERNALS|BLOCKGASEFFECT|ALLOWREBREATH
	flags_inv_hide = HIDEFACE
	flags_equip_slot = SLOT_FACE

/obj/item/clothing/mask/gas/pmc/marsoc
	name = "\improper SOF armored balaclava"
	desc = "Designed for maximum protection -- and badassery. Provides protection against facial attacks, filters toxins, and conceals the wearer's identity."
	icon_state = "balaclava"

/obj/item/clothing/mask/gas/pmc/upp
	name = "\improper UPP armored commando balaclava"
	icon_state = "upp_mask"

/obj/item/clothing/mask/gas/pmc/leader
	name = "\improper M8 pattern armored balaclava"
	desc = "An armored balaclava designed to conceal both the identity of the operator and act as an air-filter. This particular suit looks like it belongs to a high-ranking officer."
	icon_state = "officer_mask"

/obj/item/clothing/mask/gas/bear
	name = "tactical balaclava"
	desc = "A superior balaclava worn by the Iron Bears."
	icon_state = "bear_mask"
	anti_hug = 2



//Plague Dr suit can be found in clothing/suits/bio.dm
/obj/item/clothing/mask/gas/plaguedoctor
	name = "plague doctor mask"
	desc = "A modernised version of the classic design, this mask will not only filter out phoron but it can also be connected to an air supply."
	icon_state = "plaguedoctor"
	item_state = "gas_mask"
	armor_melee = CLOTHING_ARMOR_NONE
	armor_bullet = CLOTHING_ARMOR_NONE
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_NONE
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE

/obj/item/clothing/mask/gas/swat
	name = "\improper SWAT mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "swat"
	siemens_coefficient = 0.7
	flags_armor_protection = BODY_FLAG_FACE|BODY_FLAG_EYES

/obj/item/clothing/mask/gas/swat/navy
	name = "\improper flight mask"
	desc = "A close-fitting mask used by pilots who might end up exposed to the vacuum of space during sorties."

/obj/item/clothing/mask/gas/syndicate
	name = "syndicate mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "swat"
	siemens_coefficient = 0.7

/obj/item/clothing/mask/gas/voice
	name = "gas mask"
	desc = "A face-covering mask that can be connected to an air supply. It seems to house some odd electronics."

/obj/item/clothing/mask/gas/voice/space_ninja
	name = "ninja mask"
	desc = "A close-fitting mask that acts both as an air filter and a post-modern fashion statement."
	icon_state = "s-ninja"
	item_state = "s-ninja_mask"
	siemens_coefficient = 0.2
	vision_impair = VISION_IMPAIR_NONE

/obj/item/clothing/mask/gas/clown_hat
	name = "clown wig and mask"
	desc = "A true prankster's facial attire. A clown is incomplete without their wig and mask."
	icon_state = "clown"
	item_state = "clown_hat"
	vision_impair = VISION_IMPAIR_NONE
	black_market_value = 25

/obj/item/clothing/mask/gas/mime
	name = "mime mask"
	desc = "The traditional mime's mask. It has an eerie facial posture."
	icon_state = "mime"
	item_state = "mime"
	vision_impair = VISION_IMPAIR_NONE

/obj/item/clothing/mask/gas/monkeymask
	name = "monkey mask"
	desc = "A mask used when acting as a monkey."
	icon_state = "monkeymask"
	item_state = "monkeymask"
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	vision_impair = VISION_IMPAIR_NONE

/obj/item/clothing/mask/gas/fake_mustache
	name = "fake mustache"
	desc = "It is almost perfect."
	icon_state = "souto_man"
	vision_impair = VISION_IMPAIR_NONE
	unacidable = TRUE
// flags_item = NODROP|DELONDROP
	flags_inventory = CANTSTRIP|COVEREYES|COVERMOUTH|ALLOWINTERNALS|ALLOWREBREATH|BLOCKGASEFFECT|ALLOWCPR|BLOCKSHARPOBJ

//=ROYAL MARINES=\\

/obj/item/clothing/mask/gas/pmc/royal_marine
	name = "\improper L7 gasmask"
	desc = "The L7 Gasmask used by members of the three world empires royal marines commando."
	icon_state = "rmc_mask"
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
