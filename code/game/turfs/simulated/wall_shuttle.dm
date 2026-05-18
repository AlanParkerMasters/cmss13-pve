/turf/simulated/shuttle
	name = "shuttle"
	icon = 'icons/turf/shuttle.dmi'

/turf/simulated/shuttle/wall
	name = "wall"
	icon_state = "wall1"
	opacity = 1
	density = 1

/turf/simulated/shuttle/wall/pod
	name = "wall"
	icon_state = "p_wall1"

/turf/simulated/shuttle/wall/pod/two
	name = "wall"
	icon_state = "p_wall2"

/turf/simulated/shuttle/wall/corner
	var/corner_overlay_state = "diagonalWall"
	var/image/corner_overlay

//Predefined Shuttle Corners
/turf/simulated/shuttle/wall/corner/smoothwhite
	icon_state = "corner_white" //for mapping preview
	corner_overlay_state = "corner_white"
/turf/simulated/shuttle/wall/corner/smoothwhite/ne
	dir = NORTH|EAST
/turf/simulated/shuttle/wall/corner/smoothwhite/nw
	dir = NORTH|WEST
/turf/simulated/shuttle/wall/corner/smoothwhite/se
	dir = SOUTH|EAST
/turf/simulated/shuttle/wall/corner/smoothwhite/sw
	dir = SOUTH|WEST

/turf/simulated/shuttle/wall/corner/blockwhite
	icon_state = "corner_white_block"
	corner_overlay_state = "corner_white_block"
/turf/simulated/shuttle/wall/corner/blockwhite/ne
	dir = NORTH|EAST
/turf/simulated/shuttle/wall/corner/blockwhite/nw
	dir = NORTH|WEST
/turf/simulated/shuttle/wall/corner/blockwhite/se
	dir = SOUTH|EAST
/turf/simulated/shuttle/wall/corner/blockwhite/sw
	dir = SOUTH|WEST

/turf/simulated/shuttle/wall/corner/dark
	icon_state = "corner_dark"
	corner_overlay_state = "corner_dark"
/turf/simulated/shuttle/wall/corner/dark/ne
	dir = NORTH|EAST
/turf/simulated/shuttle/wall/corner/dark/nw
	dir = NORTH|WEST
/turf/simulated/shuttle/wall/corner/dark/se
	dir = SOUTH|EAST
/turf/simulated/shuttle/wall/corner/dark/sw
	dir = SOUTH|WEST

/turf/simulated/shuttle/wall/corner/pod1
	icon_state = "corner_pod1"
	corner_overlay_state = "corner_pod1"
/turf/simulated/shuttle/wall/corner/pod1/ne
	dir = NORTH|EAST
/turf/simulated/shuttle/wall/corner/pod1/nw
	dir = NORTH|WEST
/turf/simulated/shuttle/wall/corner/pod1/se
	dir = SOUTH|EAST
/turf/simulated/shuttle/wall/corner/pod1/sw
	dir = SOUTH|WEST

/turf/simulated/shuttle/wall/corner/pod2
	icon_state = "corner_pod2"
	corner_overlay_state = "corner_pod2"
/turf/simulated/shuttle/wall/corner/pod2/ne
	dir = NORTH|EAST
/turf/simulated/shuttle/wall/corner/pod2/nw
	dir = NORTH|WEST
/turf/simulated/shuttle/wall/corner/pod2/se
	dir = SOUTH|EAST
/turf/simulated/shuttle/wall/corner/pod2/sw
	dir = SOUTH|WEST
