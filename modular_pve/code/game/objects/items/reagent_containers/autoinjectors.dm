/obj/item/reagent_container/hypospray/autoinjector/iron
	name = "iron autoinjector"
	chemname = "iron"
	desc = "An autoinjector loaded with 3 uses of iron, to restore blood volume."
	amount_per_transfer_from_this = REAGENTS_OVERDOSE * INJECTOR_PERCENTAGE_OF_OD
	volume = (REAGENTS_OVERDOSE * INJECTOR_PERCENTAGE_OF_OD) * INJECTOR_USES
	display_maptext = TRUE
	maptext_label = "Fe"

/obj/item/reagent_container/hypospray/autoinjector/iron/skillless

	name = "iron EZ autoinjector"
	desc = "An EZ autoinjector loaded with 3 uses of iron, to restore blood volume. Doesn't require any training to use."
	icon_state = "emptyskill"
	item_state = "emptyskill"
