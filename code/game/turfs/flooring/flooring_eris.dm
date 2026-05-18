/*
	Flooring types which use sprites ported from eris
	These floors have edges and corners
*/

/decl/flooring/complex
	name = "advanced floor"
	icon = 'icons/turf/flooring/tiles_white.dmi'
	build_type = /obj/item/stack/tile/floor/steel/gray_perforated //Same type as the normal plating, we'll use can_build_floor to control it
	can_paint = 1
	color = COLOR_WHITE

/decl/flooring/complex/perforated_gray
	icon_base = "gray_perforated"
	build_type = /obj/item/stack/tile/floor/steel/gray_perforated


/decl/flooring/complex/perforated_brown
	icon_base = "brown_perforated"
	build_type = /obj/item/stack/tile/floor/steel/gray_perforated

/decl/flooring/complex/mono
	icon_base = "monofloor"
	has_base_range = 15
	icon = 'icons/turf/flooring/tiles_steel.dmi'
	build_type = /obj/item/stack/tile/mono


/decl/flooring/complex/techno
	icon_base = "bar_dance"
	icon = 'icons/turf/flooring/tiles_steel.dmi'
	build_type = /obj/item/stack/tile/mono
