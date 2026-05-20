// BLAST DOORS
//
// Refactored 27.12.2014 by Atlantis
//
// Blast doors are supposed to be reinforced versions of regular doors. Instead of being manually
// controlled they use buttons or other means of remote control. This is why they cannot be emagged
// as they lack any ID scanning system, they just handle remote control signals. Subtypes have
// different icons, which are defined by set of variables. Subtypes are on bottom of this file.

/obj/machinery/door/blast
	name = "Blast Door"
	desc = "That looks like it doesn't open easily."
	icon = 'icons/obj/doors/rapid_pdoor.dmi'
	icon_state = null

	// Icon states for different shutter types. Simply change this instead of rewriting the update_icon proc.
	var/icon_state_open = null
	var/icon_state_opening = null
	var/icon_state_closed = null
	var/icon_state_closing = null

	var/open_sound = 'sound/machines/blastdoor_open.ogg'
	var/close_sound = 'sound/machines/blastdoor_close.ogg'

	var/id = 1.0
	dir = 1


	//Most blast doors are infrequently toggled and sometimes used with regular doors anyways,
	//turning this off prevents awkward zone geometry in places like medbay lobby, for example.

	var/begins_closed = TRUE
	var/_wifi_id
	var/datum/wifi/receiver/button/door/wifi_receiver
	var/material/implicit_material

// SUBTYPE: Regular
// Your classical blast door, found almost everywhere.
/obj/machinery/door/blast/regular
	icon_state_open = "pdoor0"
	icon_state_opening = "pdoorc0"
	icon_state_closed = "pdoor1"
	icon_state_closing = "pdoorc1"
	icon_state = "pdoor1"

/obj/machinery/door/blast/regular/open
	begins_closed = FALSE

/obj/machinery/door/blast/regular/tram

// SUBTYPE: Shutters
// Nicer looking, and also weaker, shutters. Found in kitchen and similar areas.
/obj/machinery/door/blast/shutters
	desc = "A set of mechanized shutters made of a pretty sturdy material."
	icon_state_open = "ishimura_shutter_open"
	icon_state_opening = "ishimura_shutter_opening"
	icon_state_closed = "ishimura_shutter_closed"
	icon_state_closing = "ishimura_shutter_closing"
	icon_state = "ishimura_shutter_closed"
	open_sound = 'sound/machines/shutters_open.ogg'
	close_sound = 'sound/machines/shutters_close.ogg'

/obj/machinery/door/blast/shutters/open
	begins_closed = FALSE
