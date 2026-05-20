
/obj/structure/closet/secure_closet/scientist
	name = "scientist's locker"
	req_one_access = list(access_research)
	icon_state = "secure1"
	icon_closed = "secure"
	icon_locked = "secure1"
	icon_opened = "secureopen"
	icon_off = "secureoff"

/obj/structure/closet/secure_closet/scientist/WillContain()
	return list(
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/messenger/tox, /obj/item/storage/backpack/satchel_tox)),
		/obj/item/clothing/under/deadspace/research_assistant,
		/obj/item/clothing/suit/storage/toggle/labcoat,
		/obj/item/clothing/shoes/white,
		/obj/item/radio/headset/headset_sci,
		/obj/item/clothing/mask/gas,
		/obj/item/clipboard,
		/obj/random/tool
	)

/obj/structure/closet/secure_closet/xenobio
	name = "xenobiologist's locker"
	req_access = list(access_research)
	icon_state = "secureres1"
	icon_closed = "secureres"
	icon_locked = "secureres1"
	icon_opened = "secureresopen"
	icon_off = "secureresoff"

/obj/structure/closet/secure_closet/xenobio/WillContain()
	return list(
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/messenger/tox, /obj/item/storage/backpack/satchel_tox)),
		/obj/item/clothing/under/rank/scientist,
		/obj/item/clothing/suit/storage/toggle/labcoat,
		/obj/item/clothing/shoes/white,
		/obj/item/radio/headset/headset_sci,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/gloves/latex,
		/obj/item/clipboard,
		/obj/item/storage/belt/general,
		/obj/random/tool
	)

/obj/structure/closet/secure_closet/CSCIO
	name = "chief science officer's locker"
	req_access = list(access_cscio)
	icon_state = "secure1"
	icon_closed = "secure"
	icon_locked = "secure1"
	icon_opened = "secureopen"
	icon_off = "secureoff"

/obj/structure/closet/secure_closet/CSCIO/WillContain()
	return list(
		/obj/item/clothing/suit/bio_suit/scientist = 2,
		/obj/item/clothing/under/deadspace/chief_science_officer,
		/obj/item/clothing/suit/storage/toggle/labcoat,
		/obj/item/clothing/shoes/white,
		/obj/item/clothing/shoes/leather,
		/obj/item/clothing/gloves/latex,
		/obj/item/radio/headset/heads/cscio,
		/obj/item/clothing/mask/gas,
		/obj/item/flash,
		/obj/item/clipboard,
		/obj/item/clothing/suit/storage/toggle/labcoat/rd
	)



////GUN CABINETS



/obj/structure/closet/secure_closet/guncabinet
	name = "gun cabinet"
	req_access = list(access_security)
	icon = 'icons/obj/guncabinet.dmi'
	icon_state = "base"
	icon_off ="base"
	icon_broken ="base"
	icon_locked ="base"
	icon_closed ="base"
	icon_opened = "base"

/obj/structure/closet/secure_closet/guncabinet/WillContain()
	return list(
		/obj/item/gun/projectile/automatic/pulse_rifle,
		/obj/item/gun/projectile/shotgun/bola_lancher,
		/obj/item/ammo_magazine/pulse = 3,
		/obj/item/ammo_magazine/shotgun = 2,
		/obj/item/clothing/suit/armor/riot,
		/obj/item/clothing/head/helmet/riot
	)

/obj/structure/closet/secure_closet/guncabinet/sec_support
	name = "support weapon cabinet"
	req_access = list(access_security)
	icon = 'icons/obj/guncabinet.dmi'
	icon_state = "base"
	icon_off ="base"
	icon_broken ="base"
	icon_locked ="base"
	icon_closed ="base"
	icon_opened = "base"

/obj/structure/closet/secure_closet/guncabinet/sec_support/WillContain()
	var/list/things = list(
		/obj/item/clothing/suit/armor/riot,
		/obj/item/clothing/head/helmet/riot)
	if(prob(75))
		things += /obj/item/gun/projectile/seeker/empty
		things[/obj/item/ammo_magazine/seeker] = 4
	else
		things += /obj/item/gun/projectile/divet/rending
		things[/obj/item/stack/special_node/divet] = 4
	return things

/obj/structure/closet/secure_closet/guncabinet/military
	name = "military gun cabinet"
	req_access = list(access_security)
	icon = 'icons/obj/guncabinet.dmi'
	icon_state = "base"
	icon_off ="base"
	icon_broken ="base"
	icon_locked ="base"
	icon_closed ="base"
	icon_opened = "base"

// USE THESE EXTREMELY SPARINGLY EVEN FOR ADMINSPAWN.
/obj/structure/closet/secure_closet/guncabinet/military/WillContain()
	var/list/things = list(
		/obj/item/gun/projectile/automatic/pulse_rifle/egov/empty,
		/obj/item/ammo_magazine/pulse/hv = 6,
		/obj/item/ammo_magazine/pulse/df = 8,
		/obj/item/storage/belt/holster/security
	)
	//Contains either an HPR or a seeker rifle
	if (prob(50))
		things += /obj/item/gun/projectile/automatic/pulse_heavy
	else
		things += /obj/item/gun/projectile/seeker
		things[/obj/item/ammo_magazine/seeker] = 4

	return things

/obj/structure/closet/secure_closet/guncabinet/LateInitialize()
	. = ..()
	update_icon()

/obj/structure/closet/secure_closet/guncabinet/toggle()
	..()
	update_icon()

/obj/structure/closet/secure_closet/guncabinet/open() //There are plenty of things that can open it that don't use toggle
	..()
	update_icon()

/obj/structure/closet/secure_closet/guncabinet/update_icon()
	overlays.Cut()
	if(opened)
		overlays += icon(icon,"door_open")
	else
		var/lazors = 0
		var/shottas = 0
		for (var/obj/item/gun/G in contents)
			if (istype(G, /obj/item/gun/energy))
				lazors++
			if (istype(G, /obj/item/gun/projectile/))
				shottas++
		for (var/i = 0 to 2)
			if(lazors || shottas) // only make icons if we have one of the two types.
				var/image/gun = image(icon(src.icon))
				if (lazors > shottas)
					lazors--
					gun.icon_state = "laser"
				else if (shottas)
					shottas--
					gun.icon_state = "projectile"
				gun.pixel_x = i*4
				overlays += gun

		overlays += icon(src.icon, "door")

		if(welded)
			overlays += icon(src.icon,"welded")

		if(broken)
			overlays += icon(src.icon,"broken")
		else if (locked)
			overlays += icon(src.icon,"locked")
		else
			overlays += icon(src.icon,"open")



