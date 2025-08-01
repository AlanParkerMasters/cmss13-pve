#define HELMET_GARB_RELAY_ICON_STATE "icon_state"
/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard Security gear. Protects the head from impacts."
	icon_state = "helmet"
	item_state = "helmet"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	flags_atom = FPRINT|CONDUCT
	flags_inventory = COVEREYES|BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDEEYES
	flags_cold_protection = BODY_FLAG_HEAD
	flags_heat_protection = BODY_FLAG_HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROT
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROT
	siemens_coefficient = 0.7
	w_class = SIZE_MEDIUM
	pickup_sound = "armorequip"
	drop_sound = "armorequip"

/obj/item/clothing/head/helmet/verb/hidehair()
	set name = "Toggle Hair"
	set category = "Object"
	set src in usr
	if(!isliving(usr)) return
	if(usr.stat) return

	if(flags_inv_hide & HIDETOPHAIR)
		flags_inv_hide &= ~HIDETOPHAIR
		to_chat(usr, "You let your hair out from [src].")
	else
		flags_inv_hide |= HIDETOPHAIR
		to_chat(usr, "You tuck your hair into \the [src].")

	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(H.head == src)
			H.update_hair()

/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "It's a helmet specifically designed to protect against close range attacks. It covers your ears."
	icon_state = "riot"
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_LOW
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
	flags_inventory = COVEREYES|BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDETOPHAIR

/obj/item/clothing/head/helmet/riot/vintage_riot
	desc = "A scarred riot helmet covered in cobwebs. It still protects your ears."
	icon_state = "old_riot"

/obj/item/clothing/head/helmet/augment
	name = "augment array"
	desc = "A helmet with optical and cranial augments coupled to it."
	icon_state = "v62"
	item_state = "v62"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUM
	armor_energy = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	siemens_coefficient = 0.5

/obj/item/clothing/head/helmet/HoS
	name = "Head of Security Hat"
	desc = "The hat of the Head of Security. For showing the officers who's in charge."
	icon_state = "hoscap"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUM
	armor_energy = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	flags_inventory = COVEREYES
	flags_inv_hide = HIDEEARS
	flags_armor_protection = 0
	siemens_coefficient = 0.8

/obj/item/clothing/head/helmet/HoS/dermal
	name = "Dermal Armor Patch"
	desc = "You're not quite sure how you manage to take it on and off, but it implants nicely in your head."
	icon_state = "dermal"
	item_state = "dermal"
	siemens_coefficient = 0.6

/obj/item/clothing/head/helmet/warden
	name = "warden's hat"
	desc = "It's a special helmet issued to the Warden of a security force. Protects the head from impacts."
	icon_state = "policehelm"
	flags_inventory = NO_FLAGS
	flags_inv_hide = NO_FLAGS
	flags_armor_protection = 0

/obj/item/clothing/head/helmet/hop
	name = "crew resource's hat"
	desc = "A stylish hat that both protects you from enraged former-crewmembers and gives you a false sense of authority."
	icon_state = "hopcap"
	flags_inventory = NO_FLAGS
	flags_inv_hide = NO_FLAGS
	flags_armor_protection = 0

/obj/item/clothing/head/helmet/formalcaptain
	name = "parade hat"
	desc = "No one in a commanding position should be without a perfect, white hat of ultimate authority."
	icon_state = "officercap"
	flags_inventory = NO_FLAGS
	flags_inv_hide = NO_FLAGS
	flags_armor_protection = 0

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "They're often used by highly trained Swat Members."
	icon_state = "swat"
	item_state = "swat"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_laser = CLOTHING_ARMOR_MEDIUM
	armor_energy = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	flags_inventory = COVEREYES|BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDEEYES
	flags_cold_protection = BODY_FLAG_HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROT
	siemens_coefficient = 0.5
	anti_hug = 1

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	flags_inventory = COVEREYES|BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDEEYES
	item_state = "thunderdome"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_laser = CLOTHING_ARMOR_MEDIUM
	armor_energy = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	flags_cold_protection = BODY_FLAG_HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROT
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	item_state = "gladiator"
	flags_inventory = COVEREYES|BLOCKSHARPOBJ
	flags_inv_hide = HIDEMASK|HIDEEARS|HIDEEYES|HIDEALLHAIR
	siemens_coefficient = 1
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_LOW
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/head/helmet/tactical
	name = "tactical helmet"
	desc = "An armored helmet capable of being fitted with a multitude of attachments."
	icon_state = "swathelm"
	item_state = "helmet"
	flags_inventory = COVEREYES|BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDEEYES
	anti_hug = 1
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	siemens_coefficient = 0.7


//===========================//MARINES HELMETS\\=================================\\
//=======================================================================\\

GLOBAL_LIST_INIT(allowed_helmet_items, list(
	// TOBACCO-RELATED
	/obj/item/tool/lighter/random = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/tool/lighter/zippo = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/box/matches = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/fancy/cigarettes/emeraldgreen = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/fancy/cigarettes/kpack = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/fancy/cigarettes/lucky_strikes = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/fancy/cigarettes/wypacket = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/fancy/cigarettes/lady_finger = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/fancy/cigarettes/blackpack = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/fancy/cigarettes/arcturian_ace = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/fancy/cigarettes/spirit = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/fancy/cigarettes/spirit/yellow = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/fancy/cigarettes/laika = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/fancy/cigarettes/lucky_strikes_4 = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/storage/fancy/cigar/matchbook = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/mask/cigarette/cigar = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/mask/electronic_cigarette = HELMET_GARB_RELAY_ICON_STATE,

	// CARDS
	/obj/item/toy/deck = "helmet_card_deck",
	/obj/item/toy/deck/uno = "helmet_card_uno",
	/obj/item/toy/handcard = "helmet_card_card",
	/obj/item/toy/handcard/aceofspades = "ace_of_spades",
	/obj/item/toy/handcard/uno_reverse_red = "red_reverse",
	/obj/item/toy/handcard/uno_reverse_blue = "blue_reverse",
	/obj/item/toy/handcard/uno_reverse_yellow = "yellow_reverse",
	/obj/item/toy/handcard/uno_reverse_purple = "purple_reverse",

	// FOOD AND SNACKS
	/obj/item/reagent_container/food/drinks/flask = "helmet_flask",
	/obj/item/reagent_container/food/drinks/flask/marine = "helmet_flask",
	/obj/item/reagent_container/food/snacks/eat_bar = "helmet_snack_eat",
	/obj/item/reagent_container/food/snacks/mushroompizzaslice = "pizza", // Fuck whoever put these under different paths for some REASON
	/obj/item/reagent_container/food/snacks/vegetablepizzaslice = "pizza",
	/obj/item/reagent_container/food/snacks/meatpizzaslice = "pizza",
	/obj/item/reagent_container/food/snacks/microwavable/packaged_burrito = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/reagent_container/food/snacks/microwavable/packaged_hdogs = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/reagent_container/food/snacks/wrapped/chunk = "chunkbox",
	/obj/item/reagent_container/food/snacks/microwavable/donkpocket = "donkpocket",
	/obj/item/reagent_container/food/snacks/wrapped/booniebars = "boonie-bars",
	/obj/item/reagent_container/food/snacks/wrapped/barcardine = "barcardine-bars",


	// EYEWEAR
	/obj/item/clothing/glasses/mgoggles = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/glasses/mgoggles/prescription = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/glasses/mgoggles/black = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/glasses/mgoggles/black/prescription = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/glasses/mgoggles/orange = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/glasses/mgoggles/orange/prescription = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/glasses/mgoggles/green = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/glasses/mgoggles/green/prescription = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/glasses/mgoggles/upp = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/glasses/mgoggles/upp/prescription = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/glasses/sunglasses = "sunglasses",
	/obj/item/clothing/glasses/sunglasses/prescription = "sunglasses",
	/obj/item/clothing/glasses/sunglasses/aviator = "aviator",
	/obj/item/clothing/glasses/sunglasses/big = "bigsunglasses",
	/obj/item/clothing/glasses/sunglasses/sechud = "sechud",
	/obj/item/clothing/glasses/eyepatch = "eyepatch",
	/obj/item/clothing/glasses/regular/hipster = "persc-glasses",

	//GASMASK
	/obj/item/clothing/mask/gas/military = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/mask/gas/military/upp = HELMET_GARB_RELAY_ICON_STATE,

	// WALKMAN AND CASSETTES
	/obj/item/device/walkman = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/device/cassette_tape/pop1 = "cassette_blue",
	/obj/item/device/cassette_tape/pop2 = "cassette_rainbow",
	/obj/item/device/cassette_tape/pop3 = "cassette_orange",
	/obj/item/device/cassette_tape/pop4 = "cassette_pink_stripe",
	/obj/item/device/cassette_tape/heavymetal = "cassette_red_black",
	/obj/item/device/cassette_tape/hairmetal = "cassette_red_stripe",
	/obj/item/device/cassette_tape/indie = "cassette_rising_sun",
	/obj/item/device/cassette_tape/hiphop = "cassette_orange_blue",
	/obj/item/device/cassette_tape/nam = "cassette_green",
	/obj/item/device/cassette_tape/ocean = "cassette_ocean",
	/obj/item/storage/pouch/cassette = "cassette_pouch",

	// PREFERENCES GEAR
	/obj/item/prop/helmetgarb/gunoil = "gunoil",
	/obj/item/prop/helmetgarb/netting = "netting",
	/obj/item/prop/helmetgarb/spent_buckshot = "spent_buckshot",
	/obj/item/prop/helmetgarb/spent_slug = "spent_slug",
	/obj/item/prop/helmetgarb/spent_flech = "spent_flech",
	/obj/item/prop/helmetgarb/cartridge = "cartridge",
	/obj/item/prop/helmetgarb/prescription_bottle = "prescription_bottle",
	/obj/item/prop/helmetgarb/raincover = "raincover",
	/obj/item/prop/helmetgarb/camocover = "camocover",
	/obj/item/prop/helmetgarb/camocover/desert = "d_camocover",
	/obj/item/prop/helmetgarb/camocover/snow = "s_camocover",
	/obj/item/prop/helmetgarb/rabbitsfoot = "rabbitsfoot",
	/obj/item/prop/helmetgarb/rosary = "helmet_rosary", // This one was already in the game for some reason, but never had an object
	/obj/item/prop/helmetgarb/lucky_feather = "lucky_feather",
	/obj/item/prop/helmetgarb/lucky_feather/blue = "lucky_feather_blue",
	/obj/item/prop/helmetgarb/lucky_feather/purple = "lucky_feather_purple",
	/obj/item/prop/helmetgarb/lucky_feather/yellow = "lucky_feather_yellow",
	/obj/item/prop/helmetgarb/trimmed_wire = "trimmed_wire",
	/obj/item/prop/helmetgarb/helmet_nvg = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/prop/helmetgarb/helmet_nvg/cosmetic = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/prop/helmetgarb/helmet_nvg/marsoc = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/prop/helmetgarb/flair_initech = "flair_initech",
	/obj/item/prop/helmetgarb/flair_io = "flair_io",
	/obj/item/prop/helmetgarb/flair_peace ="flair_peace_smiley",
	/obj/item/prop/helmetgarb/flair_uscm = "flair_uscm",
	/obj/item/prop/helmetgarb/bullet_pipe = "bullet_pipe",
	/obj/item/prop/helmetgarb/spacejam_tickets = "tickets_to_space_jam",
	/obj/item/prop/helmetgarb/family_photo = "family_photo",
	/obj/item/prop/helmetgarb/compass = "compass",
	/obj/item/prop/helmetgarb/bug_spray = "bug_spray",

	// MISC
	/obj/item/tool/pen = "helmet_pen_black",
	/obj/item/tool/pen/blue = "helmet_pen_blue",
	/obj/item/tool/pen/red = "helmet_pen_red",
	/obj/item/clothing/glasses/welding ="welding-h",
	/obj/item/clothing/head/headband = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/head/headband/tan = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/head/headband/red = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/head/headband/brown = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/head/headband/gray = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/head/headband/alpha = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/head/headband/bravo = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/head/headband/charlie = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/head/headband/delta = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/head/headband/echo = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/clothing/head/headband/foxtrot = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/tool/candle = "candle",
	/obj/item/clothing/mask/facehugger/lamarr = "lamarr",
	/obj/item/toy/crayon/red = "crayonred",
	/obj/item/toy/crayon/orange = "crayonorange",
	/obj/item/toy/crayon/yellow = "crayonyellow",
	/obj/item/toy/crayon/green = "crayongreen",
	/obj/item/toy/crayon/blue = "crayonblue",
	/obj/item/toy/crayon/purple = "crayonpurple",
	/obj/item/toy/crayon/rainbow = "crayonrainbow",
	/obj/item/toy/crayon/pride/trans = "crayontrans",
	/obj/item/toy/crayon/pride/gay = "crayongay",
	/obj/item/toy/crayon/pride/lesbian = "crayonlesbian",
	/obj/item/toy/crayon/pride/bi = "crayonbi",
	/obj/item/toy/crayon/pride/pan = "crayonpan",
	/obj/item/toy/crayon/pride/ace = "crayonace",
	/obj/item/toy/crayon/pride/trans = "crayontrans",
	/obj/item/toy/crayon/pride/enby = "crayonenby",
	/obj/item/toy/crayon/pride/fluid = "crayonfluid",
	/obj/item/paper = "paper",
	/obj/item/device/flashlight/flare = "flare",
	/obj/item/clothing/head/headset = "headset",
	/obj/item/ammo_magazine/handful = "bullet",
	/obj/item/prop/helmetgarb/riot_shield = "helmet_riot_shield",
	/obj/item/attachable/flashlight = HELMET_GARB_RELAY_ICON_STATE,
	/obj/item/prop/helmetgarb/chaplain_patch = "chaplain_patch",
	/obj/item/tool/pen/fountain = "fountainpen",

	// MEDICAL
	/obj/item/stack/medical/bruise_pack ="brutepack (bandages)",
	/obj/item/stack/medical/ointment = "ointment",
	/obj/item/tool/surgery/scalpel = "scalpel",
	/obj/item/reagent_container/hypospray/autoinjector = "helmet_injector",
	/obj/item/storage/pill_bottle/packet = "brutepack (bandages)",
))

/obj/item/clothing/head/helmet/marine
	name = "\improper M10 pattern ballistic helmet"
	desc = "Standard issue high molecular density polymer combat helmet. Resistant to glancing hits from small arms and shrapnel, incorporates tactical camera, IFF signal transponder, and heads up display eyepiece. Also features white/black hot IR viewing modes from the camera system."
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	icon_state = "helmet"
	item_state = "helmet"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	health = 5
	force = 15
	throwforce = 15 // https://i.imgur.com/VW09I4B.gif
	attack_verb = list("whacked", "hit", "smacked", "beaten", "battered")
	var/obj/structure/machinery/camera/camera
	var/helmet_overlays[]
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = NONE
	var/flags_marine_helmet = HELMET_SQUAD_OVERLAY|HELMET_GARB_OVERLAY|HELMET_DAMAGE_OVERLAY
	var/helmet_bash_cooldown = 0

	//speciality does NOTHING if you have NO_NAME_OVERRIDE
	var/specialty = "M10 pattern marine" //Give them a specialty var so that they show up correctly in vendors. speciality does NOTHING if you have NO_NAME_OVERRIDE.
	valid_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	restricted_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	item_icons = list(
		WEAR_HEAD = 'icons/mob/humans/onmob/head_1.dmi'
	)

	var/obj/item/storage/internal/headgear/pockets
	var/storage_slots = 2 // Small items like injectors, bandages, etc
	var/storage_slots_reserved_for_garb = 2 // Cosmetic items & now cigarettes and lighters for RP
	var/storage_max_w_class = SIZE_TINY // can hold tiny items only, EXCEPT for glasses & metal flask.
	var/storage_max_storage_space = 4

	/// The dmi where the grayscale squad overlays are contained
	var/helmet_overlay_icon = 'icons/mob/humans/onmob/head_1.dmi'

	///Any visors built into the helmet
	var/list/built_in_visors = list(new /obj/item/device/helmet_visor)

	///Any visors that have been added into the helmet
	var/list/inserted_visors = list()

	///Max amount of inserted visors
	var/max_inserted_visors = 1

	///The current active visor that is shown
	var/obj/item/device/helmet_visor/active_visor = null

	///Designates a visor type that should start down when initialized
	var/start_down_visor_type

/obj/item/clothing/head/helmet/marine/Initialize(mapload, new_protection[] = list(MAP_ICE_COLONY = ICE_PLANET_MIN_COLD_PROT))
	. = ..()
	if(!(flags_atom & NO_NAME_OVERRIDE))
		name = "[specialty] helmet"

	if(!(flags_atom & NO_SNOW_TYPE))
		select_gamemode_skin(type, null, new_protection)

	helmet_overlays = list() //To make things simple.

	pockets = new(src)
	pockets.storage_slots = HAS_FLAG(flags_marine_helmet, HELMET_GARB_OVERLAY) ? storage_slots + storage_slots_reserved_for_garb : storage_slots
	pockets.slots_reserved_for_garb = HAS_FLAG(flags_marine_helmet, HELMET_GARB_OVERLAY) ? storage_slots_reserved_for_garb : 0
	pockets.max_w_class = storage_max_w_class
	pockets.bypass_w_limit = GLOB.allowed_helmet_items
	pockets.max_storage_space = storage_max_storage_space

	camera = new /obj/structure/machinery/camera/overwatch(src)

	for(var/obj/visor as anything in built_in_visors)
		visor.forceMove(src)

	if(length(inserted_visors) || length(built_in_visors))
		var/datum/action/item_action/cycle_helmet_huds/new_action = new(src)
		if(ishuman(loc))
			var/mob/living/carbon/human/holding_human = loc
			if(holding_human.head == src)
				new_action.give_to(holding_human)

	if(start_down_visor_type)
		for(var/obj/item/device/helmet_visor/cycled_visor in (built_in_visors + inserted_visors))
			if(cycled_visor.type == start_down_visor_type)
				active_visor = cycled_visor
				break

		if(active_visor)
			var/datum/action/item_action/cycle_helmet_huds/cycle_action = locate() in actions
			if(cycle_action)
				cycle_action.set_action_overlay(active_visor)

/obj/item/clothing/head/helmet/marine/Destroy(force)
	helmet_overlays = null
	QDEL_NULL(camera)
	QDEL_NULL(pockets)
	if(active_visor && istype(loc, /mob/living/carbon/human))
		var/mob/living/carbon/human/potential_user = loc
		if(potential_user.head == src)
			var/obj/item/device/helmet_visor/temp_visor_holder = active_visor
			active_visor = null
			toggle_visor(potential_user, temp_visor_holder, TRUE)
	return ..()

/obj/item/clothing/head/helmet/marine/attack_hand(mob/user)
	if(loc != user)
		..(user) // If it's in a satchel or something don't open the pockets
		return

	if(pockets.handle_attack_hand(user))
		..(user)


/obj/item/clothing/head/helmet/marine/MouseDrop(over_object, src_location, over_location)
	SEND_SIGNAL(usr, COMSIG_ITEM_DROPPED, usr)
	if(pockets.handle_mousedrop(usr, over_object))
		..()

/obj/item/clothing/head/helmet/marine/attackby(obj/item/attacking_item, mob/user)
	if(istype(attacking_item, /obj/item/ammo_magazine) && world.time > helmet_bash_cooldown && user)
		var/obj/item/ammo_magazine/M = attacking_item
		var/ammo_level = "more than half full."
		playsound(user, 'sound/items/trayhit1.ogg', 15, FALSE)
		if(M.current_rounds == (M.max_rounds/2))
			ammo_level = "half full."
		if(M.current_rounds < (M.max_rounds/2))
			ammo_level = "less than half full."
		if(M.current_rounds < (M.max_rounds/6))
			ammo_level = "almost empty."
		if(M.current_rounds == 0)
			ammo_level = "empty. Uh oh."
		user.visible_message("[user] bashes [M] against their helmet", "You bash [M] against your helmet. It is [ammo_level]")
		helmet_bash_cooldown = world.time + 20 SECONDS
		return

	if(istype(attacking_item, /obj/item/device/helmet_visor))
		if(length(inserted_visors) >= max_inserted_visors)
			to_chat(user, SPAN_NOTICE("[src] has used all of its visor attachment sockets."))
			return

		var/obj/item/device/helmet_visor/new_visor = attacking_item
		for(var/obj/item/device/helmet_visor/cycled_visor as anything in (built_in_visors + inserted_visors))
			if(cycled_visor.type == new_visor.type)
				to_chat(user, SPAN_NOTICE("[src] already has this type of HUD connected."))
				return
		if(!user.drop_held_item())
			return

		inserted_visors += new_visor
		to_chat(user, SPAN_NOTICE("You connect [new_visor] to [src]."))
		new_visor.forceMove(src)
		if(!(locate(/datum/action/item_action/cycle_helmet_huds) in actions))
			var/datum/action/item_action/cycle_helmet_huds/new_action = new(src)
			new_action.give_to(user)
		return

	if(HAS_TRAIT(attacking_item, TRAIT_TOOL_SCREWDRIVER))
		// If there isn't anything to remove, return.
		if(!length(inserted_visors))
			// If the user is trying to remove a built-in visor, give them a more helpful failure message.
			switch(length(built_in_visors))
				if(1) // Messy plural handling
					to_chat(user, SPAN_WARNING("The visor on [src] is built-in!"))
				if(2 to INFINITY)
					to_chat(user, SPAN_WARNING("The visors on [src] are built-in!"))
			return

		if(active_visor)
			var/obj/item/device/helmet_visor/temp_visor_holder = active_visor
			active_visor = null
			toggle_visor(user, temp_visor_holder, TRUE)

		for(var/obj/item/device/helmet_visor/visor as anything in inserted_visors)
			visor.forceMove(get_turf(src))

		inserted_visors = list()
		to_chat(user, SPAN_NOTICE("You remove the inserted visors."))

		var/datum/action/item_action/cycle_helmet_huds/cycle_action = locate() in actions
		cycle_action.set_default_overlay()
		if(!length(built_in_visors))
			cycle_action.remove_from(user)

		return

	..()
	return pockets.attackby(attacking_item, user)

/obj/item/clothing/head/helmet/marine/on_pocket_insertion()
	update_icon()

/obj/item/clothing/head/helmet/marine/on_pocket_removal()
	update_icon()

/obj/item/clothing/head/helmet/marine/update_icon()
	// Currently done by delegating to the human onmob head inventory updater
	// not the best *possible* solution, but this is complicated by the fact that
	// adding an image to src or trying to render it in overlays does nothing because
	// the "primary" icon of src is the holdable object, not the onmob.
	// the human sprite is the only thing that reliably renders things, so
	// we have to add overlays to that.
	helmet_overlays = list() // Rebuild our list every time
	if(pockets && length(pockets.contents) && (flags_marine_helmet & HELMET_GARB_OVERLAY))
		var/list/above_band_layer = list()
		var/list/below_band_layer = list()
		var/has_helmet_band = FALSE
		for(var/obj/O in pockets.contents)
			if(GLOB.allowed_helmet_items[O.type])
				var/has_band = !HAS_FLAG(O.flags_obj, OBJ_NO_HELMET_BAND)
				if(has_band)
					has_helmet_band = TRUE
				if(GLOB.allowed_helmet_items[O.type] == HELMET_GARB_RELAY_ICON_STATE)
					if(has_band)
						above_band_layer += "helmet_[O.icon_state]"
					else
						below_band_layer += "helmet_[O.icon_state]"
				else
					if(has_band)
						above_band_layer += GLOB.allowed_helmet_items[O.type]
					else
						below_band_layer += GLOB.allowed_helmet_items[O.type]
		if(has_helmet_band)
			helmet_overlays = above_band_layer + list("helmet_band") + below_band_layer
		else
			helmet_overlays = above_band_layer + below_band_layer

	if(active_visor)
		helmet_overlays += active_visor.helmet_overlay

	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_head()

/obj/item/clothing/head/helmet/marine/equipped(mob/living/carbon/human/mob, slot)
	if(camera)
		camera.c_tag = mob.name
	if(active_visor)
		recalculate_visors(mob)
	..()

/obj/item/clothing/head/helmet/marine/unequipped(mob/user, slot)
	. = ..()
	if(pockets)
		for(var/obj/item/attachable/flashlight/F in pockets)
			if(F.light_on)
				F.activate_attachment(src, user, TRUE)
	if(active_visor)
		recalculate_visors(user)

/obj/item/clothing/head/helmet/marine/dropped(mob/living/carbon/human/mob)
	if(camera)
		camera.c_tag = "Unknown"
	if(pockets)
		for(var/obj/item/attachable/flashlight/F in pockets)
			if(F.light_on)
				F.activate_attachment(src, mob, TRUE)
	if(active_visor)
		recalculate_visors(mob)
	..()

/obj/item/clothing/head/helmet/marine/has_garb_overlay()
	return flags_marine_helmet & HELMET_GARB_OVERLAY

/obj/item/clothing/head/helmet/marine/get_examine_text(mob/user)
	. = ..()
	if(active_visor)
		. += active_visor.get_helmet_examine_text()

/obj/item/clothing/head/helmet/marine/proc/add_hugger_damage() //This is called in XenoFacehuggers.dm to first add the overlay and set the var.
	if(flags_marine_helmet & HELMET_DAMAGE_OVERLAY && !(flags_marine_helmet & HELMET_IS_DAMAGED))
		helmet_overlays["damage"] = image('icons/obj/items/clothing/cm_hats.dmi',icon_state = "hugger_damage")
		flags_marine_helmet |= HELMET_IS_DAMAGED
		update_icon()
		desc += "\n<b>This helmet seems to be scratched up and damaged, particularly around the face area...</b>"

/obj/item/clothing/head/helmet/marine/get_pockets()
	if(pockets)
		return pockets
	return ..()

/// Recalculates and sets the proper visor effects
/obj/item/clothing/head/helmet/marine/proc/recalculate_visors(mob/user)
	turn_off_visors(user)

	if(!active_visor)
		return

	if(user != loc)
		return

	var/mob/living/carbon/human/human_user = user
	if(!human_user || human_user.head != src)
		return

	toggle_visor(user, silent = TRUE)

/// Toggles the specified visor, if nothing specified then the active visor, if the visor is the active visor and the helmet is on the user's head it will turn on, if it is not the active visor it will turn off
/obj/item/clothing/head/helmet/marine/proc/toggle_visor(mob/user, obj/item/device/helmet_visor/current_visor, silent = FALSE)
	current_visor = current_visor || active_visor

	if(!current_visor)
		return

	current_visor.toggle_visor(src, user, silent)

	update_icon()

/// Attempts to turn off all visors
/obj/item/clothing/head/helmet/marine/proc/turn_off_visors(mob/user)
	var/list/total_visors = built_in_visors + inserted_visors

	for(var/obj/item/device/helmet_visor/cycled_helmet_visor in total_visors)
		cycled_helmet_visor.deactivate_visor(src, user)

	update_icon()

///Cycles the active HUD to the next between built_in_visors and inserted_visors, nullifies if at end and removes all HUDs
/obj/item/clothing/head/helmet/marine/proc/cycle_huds(mob/user)
	var/list/total_visors = built_in_visors + inserted_visors

	if(!length(total_visors))
		to_chat(user, SPAN_WARNING("There are no visors to swap to."))
		return FALSE

	if(active_visor)
		var/visor_to_deactivate = active_visor
		var/skipped_hud = FALSE
		var/iterator = 1
		for(var/obj/item/device/helmet_visor/current_visor as anything in total_visors)
			if(current_visor == active_visor || skipped_hud)
				if(length(total_visors) > iterator)
					var/obj/item/device/helmet_visor/next_visor = total_visors[iterator + 1]

					if(!isnull(GLOB.huds[next_visor.hud_type]?.hudusers[user]))
						iterator++
						skipped_hud = TRUE
						continue

					if(!next_visor.can_toggle(user))
						iterator++
						skipped_hud = TRUE
						continue

					active_visor = next_visor
					toggle_visor(user, visor_to_deactivate, silent = TRUE) // disables the old visor
					toggle_visor(user)
					return active_visor
				else
					active_visor = null
					toggle_visor(user, visor_to_deactivate, FALSE)
					return FALSE
			iterator++

	for(var/obj/item/device/helmet_visor/new_visor in total_visors)
		if(!isnull(GLOB.huds[new_visor.hud_type]?.hudusers[user]))
			continue

		if(!new_visor.can_toggle(user))
			continue

		active_visor = new_visor
		toggle_visor(user)
		return active_visor

	to_chat(user, SPAN_WARNING("There are no visors to swap to currently."))
	return FALSE

/datum/action/item_action/cycle_helmet_huds/New(Target, obj/item/holder)
	. = ..()
	name = "Cycle helmet HUD"
	button.name = name
	set_default_overlay()

/datum/action/item_action/cycle_helmet_huds/action_activate()
	. = ..()
	var/obj/item/clothing/head/helmet/marine/holder_helmet = holder_item
	var/cycled_hud = holder_helmet.cycle_huds(usr)

	set_action_overlay(cycled_hud)

/// Sets the action overlay based on the visor type
/datum/action/item_action/cycle_helmet_huds/proc/set_action_overlay(obj/item/device/helmet_visor/new_visor)
	if(!new_visor)
		set_default_overlay()
		return

	action_icon_state = new_visor.action_icon_string
	button.overlays.Cut()
	button.overlays += image('icons/obj/items/clothing/helmet_visors.dmi', button, action_icon_state)

/// Sets the action overlay to default hud sight up
/datum/action/item_action/cycle_helmet_huds/proc/set_default_overlay()
	action_icon_state = "hud_sight_up"
	button.overlays.Cut()
	button.overlays += image('icons/obj/items/clothing/helmet_visors.dmi', button, action_icon_state)

/obj/item/clothing/head/helmet/marine/tech
	name = "\improper M10 technician helmet"
	desc = "A modified M10 marine helmet for ComTechs. Features a toggleable welding screen for eye protection."
	icon_state = "tech_helmet"
	specialty = "M10 technician"
	built_in_visors = list(new /obj/item/device/helmet_visor, new /obj/item/device/helmet_visor/welding_visor)

/obj/item/clothing/head/helmet/marine/grey
	desc = "A standard M10 Pattern Helmet. This one has not had a camouflage pattern applied to it yet. There is a built-in camera on the right side."
	icon_state = "c_helmet"
	item_state = "c_helmet"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/head/helmet/marine/jungle
	icon_state = "helmet"
	item_state = "helmet"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/head/helmet/marine/snow
	icon_state = "s_helmet"
	item_state = "s_helmet"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/head/helmet/marine/desert
	icon_state = "d_helmet"
	item_state = "d_helmet"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/head/helmet/marine/tech/tanker
	name = "\improper Mk20 tanker helmet"
	desc = "The older Mk20 Advanced Armored Crew Helmet is a variant of the precursor program to the Mk30, with a flipdown welding visor attached. Camera on the side and biometric transmitter ties into the sensor matrix."
	icon_state = "tanker_helmet"
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDETOPHAIR
	specialty = "M50 tanker"
	built_in_visors = list(new /obj/item/device/helmet_visor, new /obj/item/device/helmet_visor/welding_visor/tanker)

/obj/item/clothing/head/helmet/marine/medic
	name = "\improper M10 corpsman helmet"
	desc = "M10 combat helmet issued to marine hospital corpsmen. Has a red cross painted on its front for attracting the injured and snipers' attentions alike."
	icon_state = "med_helmet"
	specialty = "M10 pattern medic"
	built_in_visors = list(new /obj/item/device/helmet_visor/medical/advanced)

/obj/item/clothing/head/helmet/marine/medic/white
	name = "\improper M10 white corpsman helmet"
	desc = "An M10 marine helmet version worn by marine hospital corpsmen. Painted in medical white and has white cross in a red square painted on its front."
	icon_state = "med_helmet_white"
	specialty = "M10 pattern medic white"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	flags_marine_helmet = HELMET_GARB_OVERLAY|HELMET_DAMAGE_OVERLAY

/obj/item/clothing/head/helmet/marine/medic/plain
	desc = "M10 combat helmet issued to marine hospital corpsmen. Identical to the standard marine M10, with the exception of the integrated medical optic sight."
	icon_state = "helmet"
	specialty = "M10 pattern medic"

/obj/item/clothing/head/helmet/marine/covert
	name = "\improper M10 covert helmet"
	desc = "An M10 marine helmet version designed for use in darkened environments. It is coated with a special anti-reflective paint."
	icon_state = "marsoc_helmet"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	specialty = "M10 pattern covert"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/head/helmet/marine/leader
	name = "\improper M09 pattern helmet"
	desc = "Back issue model of an older combat helmet. Uncomfortable, but the added protection is supposedly worth it. It's been wired up the same, so it still ties into the sensor matrix fine."
	icon_state = "sl_helmet"
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	specialty = "M11 pattern marine"

/obj/item/clothing/head/helmet/marine/rto
	name = "\improper M12 pattern helmet"
	desc = "Failed procurement, limited run successor to the old M10 Ballistic Helmet. New ceramic composites and suspension system show a remarkable increase in blunt impact resistance, while a revamped wiring structure added space for a second optic socket."
	icon_state = "io"
	item_state = "io"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	specialty = "M12 pattern"
	max_inserted_visors = 2

/obj/item/clothing/head/helmet/marine/rto/intel
	name = "\improper XM12 pattern intelligence helmet"
	desc = "An experimental brain-bucket. A dust ruffle hangs from back. Moderately better at deflecting blunt objects at the cost of humiliation, can also hold a second visor optic. But who will be laughing at the memorial? Not you, you'll be busy getting medals for your intel work."
	specialty = "XM12 pattern intel"

/obj/item/clothing/head/helmet/marine/specialist
	name = "\improper B18 helmet"
	desc = "Helmet and faceplate component of the B18 armor system. Nanobonded carbonfiber laminated with ultrahigh molecular density polymer, with an integral rebreather and heads up display."
	icon_state = "grenadier_helmet"
	item_state = "grenadier_helmet"
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_ULTRAHIGH
	armor_bio = CLOTHING_ARMOR_HIGH
	armor_rad = CLOTHING_ARMOR_HIGH
	armor_internaldamage = CLOTHING_ARMOR_HIGH
	unacidable = TRUE
	anti_hug = 6
	force = 20
	specialty = "B18"

/obj/item/clothing/head/helmet/marine/grenadier
	name = "\improper M12 grenadier helmet"
	desc = "Strictly speaking, the M12 is more of an offshoot of the B-series armor systems, and is fully enclosed, with hearing protection and anti-impact liquid armor layers to cushion blast. USCMC assault teams sometimes use these in close combat, grenade heavy operations."
	icon_state = "grenadier_helmet"
	item_state = "grenadier_helmet"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_ULTRAHIGH
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_HIGH
	armor_internaldamage = CLOTHING_ARMOR_HIGH
	clothing_traits = list(TRAIT_EAR_PROTECTION)
	unacidable = TRUE
	anti_hug = 6
	specialty = "M3-G4 grenadier"
	flags_item = MOB_LOCK_ON_EQUIP|NO_CRYO_STORE

/obj/item/clothing/head/helmet/marine/scout
	name = "\improper M10-S light helmet"
	icon_state = "scout_helmet"
	desc = "M10 fitted with thermal camouflage and improved radar absorbent shell. Issued to USCMC Scouts."
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	specialty = "M3-S light"
	flags_item = MOB_LOCK_ON_EQUIP|NO_CRYO_STORE

/obj/item/clothing/head/helmet/marine/pyro
	name = "\improper M10-P pyrotechnician helmet"
	icon_state = "pyro_helmet"
	desc = "M10 variant with complete facial coverage and internal breathing apparatus. Environmentally sealed with a full fitting of polymer compounds to resist burning."
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROT
	specialty = "M35 pyrotechnician"
	flags_item = MOB_LOCK_ON_EQUIP|NO_CRYO_STORE

/obj/item/clothing/head/helmet/marine/M3T
	name = "\improper M10-R bombardier helmet"
	icon_state = "sadar_helmet"
	desc = "M10 combat helmet fitted with enhanced suspension liner and improved hearing protection, for firing high-concussion weapons like the M5 RPG. Also issued to Vehicle Crewmen."
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	armor_bomb = CLOTHING_ARMOR_HIGH
	specialty = "M3-R bombardier"
	flags_inventory = BLOCKSHARPOBJ
	clothing_traits = list(TRAIT_EAR_PROTECTION)
	unacidable = TRUE

/obj/item/clothing/head/helmet/upp/marinepilot //just so it uses the wide overlay for garbs
	name = "\improper MK30 tactical helmet"
	desc = "Standard flight helmet of the UA treaty forces. Probably one of the few good things that came out of the Joint Procurement Office. Drop-down polarized visor allows for augmented reality effects, giving relevant data in real time."
	icon_state = "helmetp"
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDETOPHAIR
	built_in_visors = list(new /obj/item/device/helmet_visor/po_visor)
	specialty = "MK30 tactical"

/obj/item/clothing/head/helmet/upp/marinepilot/tex
	name = "\improper custom Mk30 tactical helmet"
	desc = "Standard flight helmet of the UA treaty forces. Probably one of the few good things that came out of the Joint Procurement Office. Drop-down polarized visor allows for augmented reality effects, giving relevant data in real time. This one has the Texan flag painted on it."
	icon_state = "helmetp_tex"
	item_state = "helmetp_tex"
	built_in_visors = list(new /obj/item/device/helmet_visor/po_visor/lightblue)

/obj/item/clothing/head/helmet/marine/ghillie
	name = "\improper M10 ghillie helmet"
	desc = "M10 helmet fitted with thermal camouflage ghillie strips. Used and customized by USCMC Scout Snipers."
	icon_state = "ghillie_coif"
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDETOPHAIR
	flags_marine_helmet = HELMET_GARB_OVERLAY
	specialty = "M10 ghillie"

/obj/item/clothing/head/helmet/marine/CO
	name = "\improper M10 pattern commanding officer helmet"
	desc = "A special M10 Pattern Helmet worn by Commanding Officers of the USCM. It reads on the label, 'The difference between an open-casket and closed-casket funeral. Wear on head for best results.'."
	icon_state = "co_officer"
	item_state = "co_officer"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	specialty = "M10 pattern captain"
	flags_atom = NO_SNOW_TYPE
	built_in_visors = list(new /obj/item/device/helmet_visor, new /obj/item/device/helmet_visor/medical/advanced, new /obj/item/device/helmet_visor/security)

/obj/item/clothing/head/helmet/marine/MP
	name = "\improper M10 pattern MP helmet"
	desc = "A special variant of the M10 Pattern Helmet worn by the Military Police of the USCM. Whether you're facing a crime syndicate or a mutiny, this bucket will keep your brains intact."
	icon_state = "mp_helmet"
	item_state = "mp_helmet"
	specialty = "M10 pattern military police"
	built_in_visors = list(new /obj/item/device/helmet_visor/security)
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/head/helmet/marine/MP/WO
	name = "\improper M3 pattern chief MP helmet"
	desc = "A well-crafted variant of the M10 Helmet typically distributed to Chief MPs. Useful for letting your men know who is in charge."
	icon_state = "cmp_helmet"
	item_state = "cmp_helmet"
	specialty = "M10 pattern chief MP"

/obj/item/clothing/head/helmet/marine/MP/SO
	name = "\improper M10 pattern Officer Helmet"
	desc = "A special variant of the M10 Pattern Helmet worn by Officers of the USCM, attracting the attention of the grunts and sniper fire alike."
	icon_state = "helmet"
	item_state = "helmet"
	specialty = "M10 pattern officer"
	built_in_visors = list(new /obj/item/device/helmet_visor, new /obj/item/device/helmet_visor/medical/advanced)

/obj/item/clothing/head/helmet/marine/MP/provost/marshal
	name = "\improper Provost Marshal Cap"
	desc = "The expensive headwear of a Provost Marshal. Venlar lined, boron carbide tiled, tailored to wear semi-comfortably."
	icon_state = "pvmarshalhat"
	item_state = "pvmarshalhat"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	flags_inventory = BLOCKSHARPOBJ|FULL_DECAP_PROTECTION

/obj/item/clothing/head/helmet/marine/sof
	name = "\improper M09 Custom Helmet"
	desc = "Partially due to old stocks, partially due to preference. USCM MARSOC commando ballistic helmet, customized and updated to mission requirements."
	icon_state = "marsoc_helmet"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	specialty = "M10 pattern SOF"
	flags_atom = NO_SNOW_TYPE
	built_in_visors = list(new /obj/item/device/helmet_visor/night_vision/marine_raider, new /obj/item/device/helmet_visor/security)
	start_down_visor_type = /obj/item/device/helmet_visor/night_vision/marine_raider

//=============================//PMCS\\==================================\\
//=======================================================================\\

/obj/item/clothing/head/helmet/marine/veteran
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE //Let's make these keep their name and icon.
	built_in_visors = list()

/obj/item/clothing/head/helmet/marine/veteran/canc
	name = "\improper Type 93 helmet"
	desc = "Outdated CANC-style helmet."
	icon_state = "canc"
	flags_inv_hide = HIDEEARS|HIDETOPHAIR

/obj/item/clothing/head/helmet/marine/veteran/pmc
	name = "\improper tactical helmet"
	desc = "A contender for service with the Royal Marine Commandos, it is presently, exclusively, field tested by Weyland-Yutani mercenaries. This configuration lacks the iconic ballistic mask popularized by Soldier of Fortune magazine."
	icon_state = "pmc_helmet"
	flags_armor_protection = BODY_FLAG_HEAD
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_LOW
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDETOPHAIR
	flags_marine_helmet = HELMET_DAMAGE_OVERLAY|HELMET_GARB_OVERLAY

/obj/item/clothing/head/helmet/marine/veteran/pmc/leader
	name = "\improper PMC beret"
	desc = "The pinnacle of fashion for any aspiring mercenary leader. Designed to protect the head from light impacts."
	icon_state = "officer_hat"

/obj/item/clothing/head/helmet/marine/veteran/pmc/sniper
	name = "\improper tactical sniper helmet"
	desc = "A helmet worn by PMC Marksmen."
	icon_state = "pmc_sniper_hat"
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	flags_inv_hide = HIDEEARS|HIDETOPHAIR

/obj/item/clothing/head/helmet/marine/veteran/pmc/gunner
	desc = "A contender for service with the Royal Marine Commandos, it is presently, exclusively, field tested by Weyland-Yutani mercenaries. This version features a high-tech sealed ballistic mask capable of providing tactical data via its eye-lenses."
	icon_state = "heavy_helmet"
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	flags_inventory = COVEREYES|COVERMOUTH|BLOCKSHARPOBJ|BLOCKGASEFFECT
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE|HIDEMASK|HIDEALLHAIR

/obj/item/clothing/head/helmet/marine/veteran/pmc/commando
	name = "\improper M5X helmet"
	desc = "A fully enclosed, armored helmet made to complete the M5X exoskeleton armor."
	icon_state = "commando_helmet"
	item_state = "commando_helmet"
	unacidable = 1
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_ULTRAHIGH
	armor_bio = CLOTHING_ARMOR_HIGH
	armor_rad = CLOTHING_ARMOR_HIGH
	armor_internaldamage = CLOTHING_ARMOR_HIGH
	flags_inventory = COVEREYES|COVERMOUTH|BLOCKSHARPOBJ|BLOCKGASEFFECT|FULL_DECAP_PROTECTION
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE|HIDEMASK|HIDEALLHAIR
	flags_marine_helmet = HELMET_DAMAGE_OVERLAY
	unacidable = TRUE

/obj/item/clothing/head/helmet/marine/veteran/pmc/corporate
	name = "\improper WY corporate security helmet"
	desc = "A basic skull-helm worn by corporate security assets, graded to protect your head from an unruly scientist armed with a crowbar."
	icon = 'icons/mob/humans/onmob/contained/wy_goons.dmi'
	icon_state = "helmet"
	item_state = "helmet"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	contained_sprite = TRUE

/obj/item/clothing/head/helmet/marine/veteran/pmc/corporate/lead
	desc = "A basic skull-helm worn by corporate security assets. This variant is worn by low-level guards that have too much brainmatter to fit into the old one. Or so they say."
	icon_state = "lead_helmet"
	item_state = "lead_helmet"

//FIORINA / UA RIOT CONTROL HELMET//

/obj/item/clothing/head/helmet/marine/veteran/ua_riot
	name = "\improper M10 pattern ballistic helmet"
	desc = "Standard issue high molecular density polymer combat helmet. Resistant to glancing hits from small arms and shrapnel. This version is stripped down, missing the typically incorporated tactical camera, IFF signal transponder, and heads up display eyepiece."
	icon_state = "ua_riot"
	flags_atom = NO_SNOW_TYPE

// KUTJEVO HELMET

/obj/item/clothing/head/helmet/marine/veteran/kutjevo
	name = "Kutjevo Helmet"
	desc = "Standard issued helmet for the workers of Kutjevo. Contains a small webbing to hold small items like pens, oil or even a photo of a loved one."
	icon_state = "kutjevo_helmet"
	item_state = "kutjevo_helmet"

//==========================//DISTRESS\\=================================\\
//=======================================================================\\

/obj/item/clothing/head/helmet/marine/veteran/dutch
	name = "\improper Dutch's Dozen helmet"
	desc = "A protective helmet worn by some seriously experienced mercs."
	icon_state = "dutch_helmet"
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUM
	flags_marine_helmet = HELMET_GARB_OVERLAY|HELMET_DAMAGE_OVERLAY

/obj/item/clothing/head/helmet/marine/veteran/dutch/cap
	name = "\improper Dutch's Dozen cap"
	desc = "A protective cap worn by some seriously experienced mercs."
	icon_state = "dutch_cap"
	flags_inventory = NO_FLAGS
	flags_inv_hide = NO_FLAGS
	flags_marine_helmet = NO_FLAGS

/obj/item/clothing/head/helmet/marine/veteran/dutch/band
	name = "\improper Dutch's Dozen band"
	desc = "A protective band worn by some seriously experienced mercs."
	icon_state = "dutch_band"
	flags_inventory = NO_FLAGS
	flags_inv_hide = NO_FLAGS
	flags_marine_helmet = NO_FLAGS

/obj/item/clothing/head/helmet/marine/veteran/bear
	name = "\improper Iron Bear helmet"
	desc = "Is good for winter, because it has hole to put vodka through."
	icon_state = "dutch_helmet"
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_marine_helmet = HELMET_GARB_OVERLAY|HELMET_DAMAGE_OVERLAY

/obj/item/clothing/head/helmet/marine/veteran/UPP
	name = "\improper 6B75 helmet"
	desc = "Union combat helmet Almaz. Part of protective complex Kuija-M, constructed of a thin alloy shattering plate and para-aramid underlayers. The helmet includes cheek shields for shrapnel or ricochet protection, a low resolution camera system, hearing protection, and an integrated communications system. Ports for connecting infrared visors or night vision systems are also provided."
	icon_state = "upp_helmet"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_energy = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_HIGH
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	clothing_traits = list(TRAIT_EAR_PROTECTION)
	flags_marine_helmet = HELMET_SQUAD_OVERLAY|HELMET_GARB_OVERLAY|HELMET_DAMAGE_OVERLAY
	built_in_visors = list(new /obj/item/device/helmet_visor/upp)
	specialty = "6B75 helmet"

/obj/item/clothing/head/helmet/marine/veteran/UPP/heavy
	name = "\improper 6B79 helmet"
	desc = "EVA-capable enclosed helmet of the UPP's Naval Infantry. Despite offering a higher armor rating, this helmet's cumbersome design kept it from retaining a larger role in the equipment of the Naval Infantry, and instead is largely reserved for heavy weapons operators and other specialist roles."
	icon_state = "upp_helmet_heavy"
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_HIGH
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_HIGHPLUS
	armor_internaldamage = CLOTHING_ARMOR_HIGHPLUS
	specialty = "6B79 helmet"

/obj/item/clothing/head/helmet/marine/veteran/UPP/old
	name = "\improper 6B68 helmet"
	desc = "An older variant of UPPAC helmet still utilized by Territorial Guard units and Interior Troops. Tactical datalink and A/V feeds are provided, alongside facilities for an infrared imager complex."
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	icon_state = "upp_helmet_68"
	item_state = "helmet"
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = NONE
	clothing_traits = null
	flags_marine_helmet = HELMET_DAMAGE_OVERLAY
	specialty = "6B68 helmet"

//==========================//UPP\\=================================\\
//=======================================================================\\

/obj/item/clothing/head/helmet/upp
	name = "\improper 6B82 helmet"
	desc = "Naval Infantry helmet for multiple environments. Alloy/para-aramid ballistic 'shell' comprised of three seperate plates held together with a complex liner system. Capable of being worn in tandem with an exoatmospheric fighting hood. A tactical datalink and A/V feeds are provided, alongside facilities for an infrared imager complex. Surprisingly comfortable. The fabric utilized for this model is rubbery and colored after the standard paint coating of UPP armor."
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	icon_state = "upp_helmet_naval"
	item_state = "helmet"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_MEDIUM
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_HIGH
	health = 5
	force = 15
	throwforce = 15
	attack_verb = list("whacked", "hit", "smacked", "beaten", "battered")
	var/obj/structure/machinery/camera/camera
	var/helmet_overlays[]
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = NONE
	clothing_traits = list(TRAIT_EAR_PROTECTION)
	var/flags_marine_helmet = HELMET_SQUAD_OVERLAY|HELMET_GARB_OVERLAY|HELMET_DAMAGE_OVERLAY
	var/helmet_bash_cooldown = 0

	var/specialty = "6B82 helmet"
	valid_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	restricted_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	item_icons = list(
		WEAR_HEAD = 'icons/mob/humans/onmob/head_1.dmi'
	)

	var/obj/item/storage/internal/headgear/pockets
	var/storage_slots = 2
	var/storage_slots_reserved_for_garb = 2
	var/storage_max_w_class = SIZE_TINY
	var/storage_max_storage_space = 4

	var/helmet_overlay_icon = 'icons/mob/humans/onmob/head_1.dmi'

	var/list/built_in_visors = list(new /obj/item/device/helmet_visor/upp)

	var/list/inserted_visors = list()

	var/max_inserted_visors = 1

	var/obj/item/device/helmet_visor/active_visor = null

	var/start_down_visor_type

/obj/item/clothing/head/helmet/upp/Initialize(mapload, new_protection[] = list(MAP_ICE_COLONY = ICE_PLANET_MIN_COLD_PROT))
	. = ..()

	helmet_overlays = list()

	pockets = new(src)
	pockets.storage_slots = HAS_FLAG(flags_marine_helmet, HELMET_GARB_OVERLAY) ? storage_slots + storage_slots_reserved_for_garb : storage_slots
	pockets.slots_reserved_for_garb = HAS_FLAG(flags_marine_helmet, HELMET_GARB_OVERLAY) ? storage_slots_reserved_for_garb : 0
	pockets.max_w_class = storage_max_w_class
	pockets.bypass_w_limit = GLOB.allowed_helmet_items
	pockets.max_storage_space = storage_max_storage_space

	camera = new /obj/structure/machinery/camera/overwatch(src)

	for(var/obj/visor as anything in built_in_visors)
		visor.forceMove(src)

	if(length(inserted_visors) || length(built_in_visors))
		var/datum/action/item_action/cycle_helmet_huds/new_action = new(src)
		if(ishuman(loc))
			var/mob/living/carbon/human/holding_human = loc
			if(holding_human.head == src)
				new_action.give_to(holding_human)

	if(start_down_visor_type)
		for(var/obj/item/device/helmet_visor/cycled_visor in (built_in_visors + inserted_visors))
			if(cycled_visor.type == start_down_visor_type)
				active_visor = cycled_visor
				break

		if(active_visor)
			var/datum/action/item_action/cycle_helmet_huds/cycle_action = locate() in actions
			if(cycle_action)
				cycle_action.set_action_overlay(active_visor)

/obj/item/clothing/head/helmet/upp/Destroy(force)
	helmet_overlays = null
	QDEL_NULL(camera)
	QDEL_NULL(pockets)
	if(active_visor && istype(loc, /mob/living/carbon/human))
		var/mob/living/carbon/human/potential_user = loc
		if(potential_user.head == src)
			var/obj/item/device/helmet_visor/temp_visor_holder = active_visor
			active_visor = null
			toggle_visor(potential_user, temp_visor_holder, TRUE)
	return ..()

/obj/item/clothing/head/helmet/upp/attack_hand(mob/user)
	if(loc != user)
		..(user)
		return

	if(pockets.handle_attack_hand(user))
		..(user)


/obj/item/clothing/head/helmet/upp/MouseDrop(over_object, src_location, over_location)
	SEND_SIGNAL(usr, COMSIG_ITEM_DROPPED, usr)
	if(pockets.handle_mousedrop(usr, over_object))
		..()

/obj/item/clothing/head/helmet/upp/attackby(obj/item/attacking_item, mob/user)
	if(istype(attacking_item, /obj/item/ammo_magazine) && world.time > helmet_bash_cooldown && user)
		var/obj/item/ammo_magazine/M = attacking_item
		var/ammo_level = "more than half full."
		playsound(user, 'sound/items/trayhit1.ogg', 15, FALSE)
		if(M.current_rounds == (M.max_rounds/2))
			ammo_level = "half full."
		if(M.current_rounds < (M.max_rounds/2))
			ammo_level = "less than half full."
		if(M.current_rounds < (M.max_rounds/6))
			ammo_level = "almost empty."
		if(M.current_rounds == 0)
			ammo_level = "empty. Uh oh."
		user.visible_message("[user] bashes [M] against their helmet", "You bash [M] against your helmet. It is [ammo_level]")
		helmet_bash_cooldown = world.time + 20 SECONDS
		return

	if(istype(attacking_item, /obj/item/device/helmet_visor))
		if(length(inserted_visors) >= max_inserted_visors)
			to_chat(user, SPAN_NOTICE("[src] has used all of its visor attachment sockets."))
			return

		var/obj/item/device/helmet_visor/new_visor = attacking_item
		for(var/obj/item/device/helmet_visor/cycled_visor as anything in (built_in_visors + inserted_visors))
			if(cycled_visor.type == new_visor.type)
				to_chat(user, SPAN_NOTICE("[src] already has this type of HUD connected."))
				return
		if(!user.drop_held_item())
			return

		inserted_visors += new_visor
		to_chat(user, SPAN_NOTICE("You connect [new_visor] to the [src]."))
		new_visor.forceMove(src)
		if(!(locate(/datum/action/item_action/cycle_helmet_huds) in actions))
			var/datum/action/item_action/cycle_helmet_huds/new_action = new(src)
			new_action.give_to(user)
		return

	if(HAS_TRAIT(attacking_item, TRAIT_TOOL_SCREWDRIVER))
		if(!length(inserted_visors))
			switch(length(built_in_visors))
				if(1)
					to_chat(user, SPAN_WARNING("The visor on [src] is built-in!"))
				if(2 to INFINITY)
					to_chat(user, SPAN_WARNING("The visors on [src] are built-in!"))
			return

		if(active_visor)
			var/obj/item/device/helmet_visor/temp_visor_holder = active_visor
			active_visor = null
			toggle_visor(user, temp_visor_holder, TRUE)

		for(var/obj/item/device/helmet_visor/visor as anything in inserted_visors)
			visor.forceMove(get_turf(src))

		inserted_visors = list()
		to_chat(user, SPAN_NOTICE("You remove the inserted visors."))

		var/datum/action/item_action/cycle_helmet_huds/cycle_action = locate() in actions
		cycle_action.set_default_overlay()
		if(!length(built_in_visors))
			cycle_action.remove_from(user)

		return

	..()
	return pockets.attackby(attacking_item, user)

/obj/item/clothing/head/helmet/upp/on_pocket_insertion()
	update_icon()

/obj/item/clothing/head/helmet/upp/on_pocket_removal()
	update_icon()

/obj/item/clothing/head/helmet/upp/update_icon()
	helmet_overlays = list()
	if(pockets && length(pockets.contents) && (flags_marine_helmet & HELMET_GARB_OVERLAY))
		var/list/above_band_layer = list()
		var/list/below_band_layer = list()
		var/has_helmet_band = FALSE
		for(var/obj/O in pockets.contents)
			if(GLOB.allowed_helmet_items[O.type])
				var/has_band = !HAS_FLAG(O.flags_obj, OBJ_NO_HELMET_BAND)
				if(has_band)
					has_helmet_band = TRUE
				if(GLOB.allowed_helmet_items[O.type] == HELMET_GARB_RELAY_ICON_STATE)
					if(has_band)
						above_band_layer += "wide_[O.icon_state]"
					else
						below_band_layer += "wide_[O.icon_state]"
				else
					if(has_band)
						above_band_layer += GLOB.allowed_helmet_items[O.type]
					else
						below_band_layer += GLOB.allowed_helmet_items[O.type]
		if(has_helmet_band)
			helmet_overlays = above_band_layer + list("wide_band") + below_band_layer
		else
			helmet_overlays = above_band_layer + below_band_layer

	if(active_visor)
		helmet_overlays += active_visor.helmet_overlay

	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_head()

/obj/item/clothing/head/helmet/upp/equipped(mob/living/carbon/human/mob, slot)
	if(camera)
		camera.c_tag = mob.name
	if(active_visor)
		recalculate_visors(mob)
	..()

/obj/item/clothing/head/helmet/upp/unequipped(mob/user, slot)
	. = ..()
	if(pockets)
		for(var/obj/item/attachable/flashlight/F in pockets)
			if(F.light_on)
				F.activate_attachment(src, user, TRUE)
	if(active_visor)
		recalculate_visors(user)

/obj/item/clothing/head/helmet/upp/dropped(mob/living/carbon/human/mob)
	if(camera)
		camera.c_tag = "Unknown"
	if(pockets)
		for(var/obj/item/attachable/flashlight/F in pockets)
			if(F.light_on)
				F.activate_attachment(src, mob, TRUE)
	if(active_visor)
		recalculate_visors(mob)
	..()

/obj/item/clothing/head/helmet/upp/has_garb_overlay()
	return flags_marine_helmet & HELMET_GARB_OVERLAY

/obj/item/clothing/head/helmet/upp/get_examine_text(mob/user)
	. = ..()
	if(active_visor)
		. += active_visor.get_helmet_examine_text()

/obj/item/clothing/head/helmet/upp/proc/add_hugger_damage() //This is called in XenoFacehuggers.dm to first add the overlay and set the var.
	if(flags_marine_helmet & HELMET_DAMAGE_OVERLAY && !(flags_marine_helmet & HELMET_IS_DAMAGED))
		helmet_overlays["damage"] = image('icons/obj/items/clothing/cm_hats.dmi',icon_state = "hugger_damage")
		flags_marine_helmet |= HELMET_IS_DAMAGED
		update_icon()
		desc += "\n<b>This helmet seems to be scratched up and damaged, particularly around the face area...</b>"

/obj/item/clothing/head/helmet/upp/get_pockets()
	if(pockets)
		return pockets
	return ..()

/obj/item/clothing/head/helmet/upp/proc/recalculate_visors(mob/user)
	turn_off_visors(user)

	if(!active_visor)
		return

	if(user != loc)
		return

	var/mob/living/carbon/human/human_user = user
	if(!human_user || human_user.head != src)
		return

	toggle_visor(user, silent = TRUE)

/obj/item/clothing/head/helmet/upp/proc/toggle_visor(mob/user, obj/item/device/helmet_visor/current_visor, silent = FALSE)
	current_visor = current_visor || active_visor

	if(!current_visor)
		return

	current_visor.toggle_visor(src, user, silent)

	update_icon()

/obj/item/clothing/head/helmet/upp/proc/turn_off_visors(mob/user)
	var/list/total_visors = built_in_visors + inserted_visors

	for(var/obj/item/device/helmet_visor/cycled_helmet_visor in total_visors)
		cycled_helmet_visor.deactivate_visor(src, user)

	update_icon()

/obj/item/clothing/head/helmet/upp/proc/cycle_huds(mob/user)
	var/list/total_visors = built_in_visors + inserted_visors

	if(!length(total_visors))
		to_chat(user, SPAN_WARNING("There are no visors to swap to."))
		return FALSE

	if(active_visor)
		var/visor_to_deactivate = active_visor
		var/skipped_hud = FALSE
		var/iterator = 1
		for(var/obj/item/device/helmet_visor/current_visor as anything in total_visors)
			if(current_visor == active_visor || skipped_hud)
				if(length(total_visors) > iterator)
					var/obj/item/device/helmet_visor/next_visor = total_visors[iterator + 1]

					if(!isnull(GLOB.huds[next_visor.hud_type]?.hudusers[user]))
						iterator++
						skipped_hud = TRUE
						continue

					if(!next_visor.can_toggle(user))
						iterator++
						skipped_hud = TRUE
						continue

					active_visor = next_visor
					toggle_visor(user, visor_to_deactivate, silent = TRUE)
					toggle_visor(user)
					return active_visor
				else
					active_visor = null
					toggle_visor(user, visor_to_deactivate, FALSE)
					return FALSE
			iterator++

	for(var/obj/item/device/helmet_visor/new_visor in total_visors)
		if(!isnull(GLOB.huds[new_visor.hud_type]?.hudusers[user]))
			continue

		if(!new_visor.can_toggle(user))
			continue

		active_visor = new_visor
		toggle_visor(user)
		return active_visor

	to_chat(user, SPAN_WARNING("There are no visors to swap to currently."))
	return FALSE

/obj/item/clothing/head/helmet/upp/alt
	desc = "Naval Infantry helmet for multiple environments. Alloy/para-aramid ballistic 'shell' comprised of three seperate plates held together with a complex liner system. Capable of being worn in tandem with an exoatmospheric fighting hood. A tactical datalink and A/V feeds are provided, alongside facilities for an infrared imager complex. Surprisingly comfortable. The fabric utilized for this model is identical to the one used for UPP uniforms."
	icon_state = "upp_helmet_naval_alt"

/obj/item/clothing/head/uppcap
	name = "\improper UL2 cap"
	desc = "Standard issue patrol cap of the UPP's military."
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	icon_state = "upp_cap"
	item_icons = list(
		WEAR_HEAD = 'icons/mob/humans/onmob/head_1.dmi'
	)
	siemens_coefficient = 2
	flags_armor_protection = BODY_FLAG_HEAD
	armor_melee = CLOTHING_ARMOR_VERYLOW
	armor_bullet = CLOTHING_ARMOR_NONE
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_NONE
	flags_cold_protection = BODY_FLAG_HEAD
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_inventory = null

/obj/item/clothing/head/uppcap/civi
	name = "\improper UL2c cap"
	icon_state = "upp_cap_civi"

/obj/item/clothing/head/uppcap/boonie
	name = "\improper UL5 hat"
	desc = "Standard issue soft brimmed hat for Territorial Guard units stationed in areas with extreme heat."
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	icon_state = "upp_boonie"

/obj/item/clothing/head/uppcap/boonie/canc
	name = "\improper boonie hat"
	desc = "A boonie hat in CANC uniform colors."
	icon_state = "canc_boonie"

/obj/item/clothing/head/uppcap/beret/naval
	name = "\improper UL4 Naval Infantry beret"
	desc = "A black beret worn by the UPP's Naval Infantry. Wear it with pride."
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	icon_state = "upp_beret_naval"

/obj/item/clothing/head/uppcap/beret/guerilla
	name = "\improper red beret"
	desc = "A red beret popular with communist revolutionaries."
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	icon_state = "upp_beret_revolution"

/obj/item/clothing/head/uppcap/beret
	name = "\improper UL3 beret"
	desc = "Standard issue beret of the UPP's military."
	icon_state = "upp_beret"

/obj/item/clothing/head/uppcap/peaked
	name = "\improper UL3 peaked cap"
	desc = "Standard issue peaked service cap of the UPP's military."
	icon_state = "upp_peaked"

/obj/item/clothing/head/uppcap/peaked/police
	name = "\improper UL3 PaP peaked cap"
	desc = "Standard issue peaked cap of the People's Armed Police."
	icon_state = "upp_peaked_police"

/obj/item/clothing/head/uppcap/peaked/mss
	name = "\improper UL3 MSS peaked cap"
	desc = "Standard issue peaked cap of the Ministry of Space Security."
	icon_state = "upp_peaked_mss"

/obj/item/clothing/head/uppcap/ushanka
	name = "\improper UL2 ushanka"
	desc = "Standard issue cold weather hat of the UPP's military."
	icon_state = "upp_ushanka"
	item_state = "upp_ushanka"
	var/tied = FALSE
	var/original_state = "upp_ushanka"
	flags_inv_hide = HIDEEARS

/obj/item/clothing/head/uppcap/ushanka/verb/flaps_up()
	set name = "Tie Up/Down"
	set category = "Object"
	set src in usr
	if(usr.is_mob_incapacitated())
		return

	tied = !tied
	if(tied)
		to_chat(usr, SPAN_NOTICE("You tie \the [src] up."))
		icon_state += "_up"
	else
		to_chat(usr, SPAN_NOTICE("You untie \the [src]."))
		icon_state = original_state



	update_clothing_icon(src) //Update the on-mob icon.

/obj/item/clothing/head/uppcap/ushanka/civi
	name = "\improper UL2c ushanka"
	icon_state = "upp_ushanka_civi"
	item_state = "upp_ushanka_civi"
	original_state = "upp_ushanka_civi"
	flags_inv_hide = HIDEEARS

/obj/item/clothing/head/helmet/marine/veteran/van_bandolier
	name = "pith helmet"
	desc = "A stylish pith helmet, made from space-age materials. Lightweight, breathable, cool, and protective."
	icon_state = "van_bandolier"
	item_state = "s_helmet"
	flags_marine_helmet = NO_FLAGS

//head rag

/obj/item/clothing/head/helmet/specrag
	name = "weapons specialist head-rag"
	desc = "A hat worn by heavy-weapons operators to block sweat."
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	icon_state = "spec"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_MEDIUMLOW
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM
	flags_inventory = NO_FLAGS
	flags_inv_hide = HIDEEARS|HIDETOPHAIR
	item_icons = list(
		WEAR_HEAD = 'icons/mob/humans/onmob/head_1.dmi'
	)

/obj/item/clothing/head/helmet/specrag/New()
	select_gamemode_skin(type)
	..()

/obj/item/clothing/head/helmet/skullcap
	name = "skullcap"
	desc = "Good for keeping sweat out of your eyes"
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	icon_state = "skullcap"
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_MEDIUMLOW
	armor_internaldamage = CLOTHING_ARMOR_LOW
	flags_inventory = NO_FLAGS
	flags_inv_hide = HIDEEARS|HIDETOPHAIR
	item_icons = list(
		WEAR_HEAD = 'icons/mob/humans/onmob/head_1.dmi'
	)

/obj/item/clothing/head/helmet/skullcap/jungle
	name = "\improper M8 marksman cowl"
	desc = "A cowl worn to conceal the face of a marksman in the jungle."
	icon_state = "skullcapm"

/obj/item/clothing/head/helmet/skullcap/jungle/New(loc, type,
	new_protection[] = list(MAP_ICE_COLONY = ICE_PLANET_MIN_COLD_PROT))
	select_gamemode_skin(type,, new_protection)
	..()
	switch(icon_state)
		if("s_skullcapm")
			desc = "A hood meant to protect the wearer from both the cold and the guise of the enemy in the tundra."
			flags_inv_hide = HIDEEARS|HIDEALLHAIR

//===========================//HELGHAST - MERCENARY\\================================\\
//=====================================================================\\

/obj/item/clothing/head/helmet/marine/veteran/mercenary
	name = "\improper K12 ceramic helmet"
	desc = "A sturdy helmet worn by an unknown mercenary group."
	icon_state = "mercenary_heavy_helmet"
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_HIGHPLUS
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_HIGHPLUS
	flags_inventory = COVEREYES|COVERMOUTH|BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE|HIDEMASK|HIDEALLHAIR
	flags_marine_helmet = HELMET_DAMAGE_OVERLAY

/obj/item/clothing/head/helmet/marine/veteran/mercenary
	name = "\improper Modified K12 ceramic helmet"
	desc = "A sturdy helmet worn by an unknown mercenary group. Reinforced with extra plating."
	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGHPLUS
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_HIGHPLUS
	armor_bio = CLOTHING_ARMOR_HIGHPLUS
	armor_rad = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_VERYHIGHPLUS

/obj/item/clothing/head/helmet/marine/veteran/mercenary/miner
	name = "\improper Y8 miner helmet"
	desc = "A sturdy helmet, specialised for mining, worn by an unknown mercenary group."
	icon_state = "mercenary_miner_helmet"
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_HIGHPLUS


/obj/item/clothing/head/helmet/marine/veteran/mercenary/support
	name = "\improper Z7 helmet"
	desc = "A sturdy helmet worn by an unknown mercenary group."
	icon_state = "mercenary_engineer_helmet"
	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_HIGHPLUS

/obj/item/clothing/head/helmet/marine/veteran/mercenary/support/engineer
	desc = "A sturdy helmet worn by an unknown mercenary group. Features a toggleable welding screen for eye protection."
	built_in_visors = list(new /obj/item/device/helmet_visor/welding_visor/mercenary)

//=============================//MEME\\==================================\\
//=======================================================================\\

/obj/item/clothing/head/helmet/marine/specialist/hefa
	name = "\improper HEFA helmet"
	specialty = "HEFA"
	desc = "For some reason, seeing this helmet causes you to feel extremely distressed."
	icon_state = "hefa_helmet"
	item_state = "hefa_helmet"
	armor_bomb = CLOTHING_ARMOR_HARDCORE // the hefa knight stands
	flags_inv_hide = HIDEEARS|HIDEALLHAIR|HIDEEYES
	flags_marine_helmet = NO_FLAGS
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bomb = CLOTHING_ARMOR_GIGAHIGH

	built_in_visors = list()

	var/mob/activator = null
	var/active = FALSE
	var/det_time = 40

/obj/item/clothing/head/helmet/marine/specialist/hefa/Initialize(mapload, list/new_protection)
	. = ..()
	pockets.bypass_w_limit = list(/obj/item/explosive/grenade/high_explosive/frag)

/obj/item/clothing/head/helmet/marine/specialist/hefa/proc/apply_explosion_overlay()
	var/obj/effect/overlay/O = new /obj/effect/overlay(loc)
	O.name = "grenade"
	O.icon = 'icons/effects/explosion.dmi'
	flick("grenade", O)
	QDEL_IN(O, 7)

/obj/item/clothing/head/helmet/marine/specialist/hefa/attack_self(mob/user)
	..()
	activator = user
	activate()

/obj/item/clothing/head/helmet/marine/specialist/hefa/proc/activate()
	if(active)
		return
	active = TRUE

	icon_state = initial(icon_state) + "_active"
	item_state = initial(item_state) + "_active"
	overlays += /obj/effect/overlay/danger
	playsound(loc, 'sound/weapons/armbomb.ogg', 25, 1, 6)

	addtimer(CALLBACK(src, PROC_REF(prime)), det_time)

/obj/item/clothing/head/helmet/marine/specialist/hefa/proc/prime()
	INVOKE_ASYNC(src, PROC_REF(boom))

// Values nabbed from the HEFA nade
/obj/item/clothing/head/helmet/marine/specialist/hefa/proc/boom()
	// TODO: knock down user so the shrapnel isn't all taken by the user
	var/datum/cause_data/cause_data = create_cause_data(initial(name), activator)
	create_shrapnel(loc, 48, , ,/datum/ammo/bullet/shrapnel, cause_data)
	sleep(2) //so that mobs are not knocked down before being hit by shrapnel. shrapnel might also be getting deleted by explosions?
	apply_explosion_overlay()
	cell_explosion(loc, 40, 18, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, cause_data)
	qdel(src)

/obj/item/clothing/head/helmet/marine/reporter
	name = "press helmet"
	desc = "A helmet designed to make it clear that the wearer is safety aware and not looking for a fight."
	icon_state = "cc_helmet"
	item_state = "cc_helmet"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

	built_in_visors = list()

/obj/item/clothing/head/helmet/marine/cbrn_hood
	name = "\improper M3 MOPP mask"
	desc = "The M3 MOPP mask includes a full covering cowl that securely attaches to the MOPP suit. The mask filters out harmful particles in the air to allow the wearer to breathe safely in the field. Depending on the hostility of the contaminated area the mask’s filter will last an average of 12 hours or less."
	icon_state = "cbrn_hood"
	item_state = "cbrn_hood"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROT
	flags_cold_protection = BODY_FLAG_HEAD
	flags_heat_protection = BODY_FLAG_HEAD
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_HIGH
	armor_rad = CLOTHING_ARMOR_HIGHPLUS
	force = 0 //"The M3 MOPP mask would be a normal weapon if you were to hit someone with it."
	throwforce = 0
	flags_inventory = BLOCKSHARPOBJ
	flags_marine_helmet = NO_FLAGS
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	flags_inv_hide = HIDEEARS|HIDEALLHAIR
	built_in_visors = list()

/obj/item/clothing/head/helmet/marine/cbrn_hood/advanced
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_ULTRAHIGH
	armor_bio = CLOTHING_ARMOR_GIGAHIGHPLUS
	armor_rad = CLOTHING_ARMOR_GIGAHIGHPLUS

//=ROYAL MARINES=\\

/obj/item/clothing/head/helmet/marine/veteran/royal_marine
	name = "\improper L5A2 ballistic helmet"
	desc = "A High-cut ballistic helmet. Designed by Lindenthal-Ehrenfeld Militärindustrie it is intended to be used by Royal Marines Commando as part of the kestrel armour system."
	icon_state = "rmc_helm1"
	item_state = "rmc_helm1"
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_LOW
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = NO_FLAGS
	flags_marine_helmet = NO_FLAGS
	flags_atom = NO_NAME_OVERRIDE|NO_SNOW_TYPE

/obj/item/clothing/head/helmet/marine/veteran/royal_marine/breacher
	name = "\improper L5A3 ballistic helmet"
	desc = "A High-cut ballistic helmet featuring an attached mandible. Designed by Lindenthal-Ehrenfeld Militärindustrie it is intended to be used by Royal Marines Commando as part of the kestrel armour system"
	icon_state = "rmc_helm_br"
	item_state = "rmc_helm_br"
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_energy = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bio = CLOTHING_ARMOR_MEDIUM
	armor_internaldamage = CLOTHING_ARMOR_LOW

//=USASF & ARMY=\\

/obj/item/clothing/head/helmet/marine/tech/tanker/para
	name = "\improper MK25 para-rescue helmet"
	desc = "A heavily modified USCM tanker helmet used by members of the USASF para-rescue units for it's compact design and adequate protection. Camera on the side and biometric transmitter ties into the sensor matrix."
	built_in_visors = list(new /obj/item/device/helmet_visor/medical/army)
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/head/helmet/marine/rto/navy
	name = "\improper M12 pattern naval-deployment helmet"
	desc = "Whilst the USCMC ultimately didn't adopt it, the USASF were more than happy to replace their aging stock of M09 helmets for personnel whose duties saw them deploy off-ship."
	built_in_visors = list(new /obj/item/device/helmet_visor/medical/army)
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/head/helmet/marine/rto/army
	name = "\improper Personal Head Armor System helmet"
	desc = "Despite it failing to be procured by the USCMC, the US Army happily introduced the new M12 series of helmets to vast swathes of it's forces in a short span of time under the PHAS program, a complementary program to the PBAS."
	icon_state = "army_helmet"
	item_state = "army_helmet"
	built_in_visors = list(new /obj/item/device/helmet_visor/medical/army)
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH
	flags_inventory = BLOCKSHARPOBJ
	clothing_traits = list(TRAIT_EAR_PROTECTION) //So I don't have to make another subtype for the rocketeers

/obj/item/clothing/head/helmet/construction
	name = "utility helmet"
	icon = 'icons/obj/items/clothing/cm_hats.dmi'
	icon_state = "rmc_helm2"
	item_icons = list(
		WEAR_HEAD = 'icons/mob/humans/onmob/head_1.dmi'
	)
	item_state = "rmc_helm2"
	desc = "A common helmet used by various blue-collar professions in the TWE."
