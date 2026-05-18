// tg port thing

//different types of atom colorations
/// Only used by rare effects like greentext coloring mobs and when admins varedit color
#define ADMIN_COLOR_PRIORITY 1
/// e.g. purple effect of the revenant on a mob, black effect when mob electrocuted
#define TEMPORARY_COLOR_PRIORITY 2
/// Color splashed onto an atom (e.g. paint on turf)
#define WASHABLE_COLOR_PRIORITY 3
/// Color inherent to the atom (e.g. blob color)
#define FIXED_COLOR_PRIORITY 4
///how many color priority levels there are.
#define COLOR_PRIORITY_AMOUNT 4

// BLACK AND WHITE COLOR DEFINE.

/// White	rgb(255, 255, 255)
#define COLOR_WHITE "#FFFFFF"
/// Black	rgb(0, 0, 0)
#define COLOR_BLACK "#000000"

// THE THREE PRIMARIES COLORS DEFINES.

/// Red		rgb(255, 0, 0)
#define COLOR_RED "#FF0000"
/// Green	rgb(0, 255, 0)
#define COLOR_GREEN "#00FF00"
/// Blue	rgb(0, 0, 255)
#define COLOR_BLUE "#0000FF"

//mix of two full primary colors

/// Cyan	rgb(0, 255, 255) B + G
#define COLOR_CYAN "#00FFFF"
/// Magenta	rgb(255, 0, 255) R+B
#define COLOR_MAGENTA "#FF00FF"
/// Yellow	rgb(255, 255, 0) R+G
#define COLOR_YELLOW "#FFFF00"

// colors define in use bellow

/// Olive	rgb(128, 128, 0)
#define COLOR_OLIVE "#808000"
/// Silver	rgb(192, 192, 192) shade of grey
#define COLOR_SILVER "#C0C0C0"
/// Gray	rgb(128, 128, 128)
#define COLOR_GRAY "#808080"

#define COLOR_FLOORTILE_GRAY "#8D8B8B"

#define COLOR_HALF_TRANSPARENT_BLACK "#0000007A"

#define COLOR_DARK_RED "#A50824"

/// Maroon	rgb(128, 0, 0) shade of red
#define COLOR_MAROON "#800000"

#define COLOR_VIVID_RED "#FF3232"
#define COLOR_LIGHT_GRAYISH_RED "#E4C7C5"
#define COLOR_SOFT_RED "#FA8282"

#define COLOR_VERY_SOFT_YELLOW "#FAE48E"

///light green rgb( 0, 128, 0)
#define COLOR_LIGHT_GREEN "#008000"
#define COLOR_DARK_MODERATE_LIME_GREEN "#44964A"
#define COLOR_SOFT_GREEN "#B6F19A"

#define COLOR_TEAL "#008080"

#define COLOR_MODERATE_BLUE "#555CC2"
/// Purple	rgb( 128, 0, 128)
#define COLOR_PURPLE "#800080"
#define COLOR_STRONG_VIOLET "#6927c5"

#define LIGHT_BEIGE "#CEB689"
#define COLOR_DARK_MODERATE_ORANGE "#8B633B"

#define COLOR_BROWN "#BA9F6D"
#define COLOR_DARK_BROWN "#997C4F"

/**
 * Some defines to generalise Colors used in lighting.
 *
 * Important note: Colors can end up significantly different from the basic html picture, especially when saturated
 */

/// Bright but quickly dissipating neon green. rgb(100, 200, 100)
#define LIGHT_COLOR_GREEN   "#64C864"
/// Cold, diluted blue. rgb(100, 150, 250)
#define LIGHT_COLOR_BLUE    "#6496FA"
/// Light blueish green. rgb(125, 225, 175)
#define LIGHT_COLOR_BLUEGREEN  "#7DE1AF"
/// Diluted cyan. rgb(125, 225, 225)
#define LIGHT_COLOR_CYAN    "#7DE1E1"
/// More-saturated cyan. rgb(64, 206, 255)
#define LIGHT_COLOR_LIGHT_CYAN "#40CEFF"
/// Saturated blue. rgb(51, 117, 248)
#define LIGHT_COLOR_DARK_BLUE  "#3375F8"
/// Diluted, mid-warmth pink. rgb(225, 125, 225)
#define LIGHT_COLOR_PINK    "#E17DE1"
/// Dimmed yellow, leaning kaki. rgb(225, 225, 125)
#define LIGHT_COLOR_YELLOW  "#E1E17D"
/// Clear brown, mostly dim. rgb(150, 100, 50)
#define LIGHT_COLOR_BROWN   "#966432"
/// Mostly pure orange. rgb(250, 150, 50)
#define LIGHT_COLOR_ORANGE  "#FA9632"
/// Light Purple. rgb(149, 44, 244)
#define LIGHT_COLOR_PURPLE  "#952CF4"
/// Less-saturated light purple. rgb(155, 81, 255)
#define LIGHT_COLOR_LAVENDER   "#9B51FF"
///slightly desaturated bright yellow.
#define LIGHT_COLOR_HOLY_MAGIC "#FFF743"
/// deep crimson
#define LIGHT_COLOR_BLOOD_MAGIC "#D00000"
/// Warm red color rgb(250, 66, 66)
#define LIGHT_COLOR_RED "#ff3b3b"

/* These ones aren't a direct color like the ones above, because nothing would fit */
/// Warm orange color, leaning strongly towards yellow. rgb(250, 160, 25)
#define LIGHT_COLOR_FIRE    "#FAA019"
/// Very warm yellow, leaning slightly towards orange. rgb(196, 138, 24)
#define LIGHT_COLOR_LAVA    "#C48A18"
/// Very warm yellowish-white color for candlelight. rgb(255, 187, 110)
#define LIGHT_COLOR_CANDLE "#FFBB6E"
/// Bright, non-saturated red. Leaning slightly towards pink for visibility. rgb(250, 100, 75)
#define LIGHT_COLOR_FLARE   "#FA644B"
/// Weird color, between yellow and green, very slimy. rgb(175, 200, 75)
#define LIGHT_COLOR_SLIME_LAMP "#AFC84B"
/// Incandascent warm white, for usage in lights. rgb(255, 239, 210)
#define LIGHT_COLOR_TUNGSTEN "#FFEFD2"
/// Barely visible cyan-ish hue, as the doctor prescribed. rgb(240, 250, 250)
#define LIGHT_COLOR_HALOGEN "#F0FAFA"
/// Bluish cyan color for blue lights. rgb(210, 227, 236)
#define LIGHT_COLOR_XENON "#D2E3EC"
/// Red found on submarines for perserving nightvision. rgb(210, 227, 236)
#define LIGHT_COLOR_RED_BULB "#c02526"
/// A shade of xenon that is found only on the USS Golden Arrow. rgb(218, 226, 255)
#define LIGHT_COLOR_XENON_UA "#dae2ff"

/// The default color for admin say, used as a fallback when the preference is not enabled

#define COLOR_MOSTLY_PURE_RED "#FF3300"
#define DEFAULT_ASAY_COLOR COLOR_MOSTLY_PURE_RED

#define DEFAULT_HEX_COLOR_LEN 6

// Color filters
/// Icon filter that creates ambient occlusion
#define AMBIENT_OCCLUSION filter(type="drop_shadow", x=0, y=-2, size=4, border=4, color="#04080FAA")
/// Icon filter that creates gaussian blur
#define GAUSSIAN_BLUR(filter_size) filter(type="blur", size=filter_size)

//some colors coming from _math.dm

#define COLOR_ORANGE "#FF9900"
#define COLOR_OIL "#030303"

//Grass Colors coming from _math.dm

#define COLOR_G_ICE "#C7EDDE" //faded cyan
#define COLOR_G_DES "#FF7C1C" //bright orange
#define COLOR_G_JUNG "#64AA6E" //faded green

/// Gun muzzle colors
#define COLOR_LASER_RED "#FF8D8D"
#define COLOR_MUZZLE_BLUE "#2CB2E8"

// BYOND lower-cases color values, and thus we do so as well to ensure atom.color == COLOR_X will work correctly
#define COLOR_NAVY_BLUE        "#000080"
#define COLOR_DARK_GRAY        "#404040"
#define COLOR_VIOLET           "#9933ff"
#define COLOR_BROWN_ORANGE     "#824b28"
#define COLOR_DARK_ORANGE      "#b95a00"
#define COLOR_GRAY40           "#666666"
#define COLOR_SEDONA           "#cc6600"
#define COLOR_DEEP_SKY_BLUE    "#00e1ff"
#define COLOR_LIME             "#00ff00"
#define COLOR_PINK             "#ff00ff"
#define COLOR_RED_GRAY         "#aa5f61"
#define COLOR_GREEN_GRAY       "#8daf6a"
#define COLOR_BLUE_GRAY        "#6a97b0"
#define COLOR_SUN              "#ec8b2f"
#define COLOR_PURPLE_GRAY      "#a2819e"
#define COLOR_BLUE_LIGHT       "#33ccff"
#define COLOR_RED_LIGHT        "#ff3333"
#define COLOR_BEIGE            "#ceb689"
#define COLOR_PALE_GREEN_GRAY  "#aed18b"
#define COLOR_PALE_RED_GRAY    "#cc9090"
#define COLOR_PALE_PURPLE_GRAY "#bda2ba"
#define COLOR_PALE_BLUE_GRAY   "#8bbbd5"
#define COLOR_LUMINOL          "#66ffff"
#define COLOR_GRAY80           "#cccccc"
#define COLOR_OFF_WHITE        "#eeeeee"
#define COLOR_NT_RED           "#9d2300"
#define COLOR_GUNMETAL         "#545c68"
#define COLOR_MUZZLE_FLASH     "#ffffb2"
#define COLOR_CHESTNUT         "#996633"
#define COLOR_BEASTY_BROWN     "#663300"
#define COLOR_WHEAT            "#ffff99"
#define COLOR_CYAN_BLUE        "#3366cc"
#define COLOR_LIGHT_CYAN       "#66ccff"
#define COLOR_PAKISTAN_GREEN   "#006600"
#define COLOR_HULL             "#436b8e"
#define COLOR_AMBER            "#ffbf00"
#define COLOR_COMMAND_BLUE     "#46698c"
#define COLOR_SKY_BLUE         "#5ca1cc"
#define COLOR_PALE_ORANGE      "#b88a3b"
#define COLOR_CIVIE_GREEN      "#b7f27d"
#define COLOR_TITANIUM         "#d1e6e3"
#define COLOR_DARK_GUNMETAL    "#4c535b"
#define COLOR_GOLD			   "#d4af37"
#define COLOR_CULT_RED		   "#960000"

#define	PIPE_COLOR_BLACK       "#444444"
#define	PIPE_COLOR_ORANGE      "#b95a00"

#define	COMMS_COLOR_DEFAULT    "#ff00ff"
#define	COMMS_COLOR_ENTERTAIN  "#666666"
#define	COMMS_COLOR_AI         "#ff00ff"
#define	COMMS_COLOR_COMMON     "#408010"
#define	COMMS_COLOR_SERVICE    "#709b00"
#define	COMMS_COLOR_SUPPLY     "#7f6539"
#define	COMMS_COLOR_SCIENCE    "#993399"
#define	COMMS_COLOR_MEDICAL    "#009190"
#define	COMMS_COLOR_MINING     "#929820"
#define	COMMS_COLOR_ENGINEER   "#a66300"
#define	COMMS_COLOR_SECURITY   "#930000"
#define	COMMS_COLOR_COMMAND    "#204090"
#define	COMMS_COLOR_CENTCOMM   "#5c5c7c"
#define	COMMS_COLOR_SYNDICATE  "#6d3f40"

#define GLASS_COLOR            "#74b1ee"
#define GLASS_COLOR_PHORON     "#7c3a9a"
#define GLASS_COLOR_TINTED     "#222222"
#define GLASS_COLOR_FROSTED    "#ffffff"

#define COLOR_BLOOD_HUMAN      "#a10808"
#define COLOR_BLOOD_NECRO      "#583001"

//Color defines used by the assembly detailer.
#define COLOR_ASSEMBLY_BLACK   "#545454"
#define COLOR_ASSEMBLY_BGRAY   "#9497ab"
#define COLOR_ASSEMBLY_WHITE   "#e2e2e2"
#define COLOR_ASSEMBLY_RED     "#cc4242"
#define COLOR_ASSEMBLY_ORANGE  "#e39751"
#define COLOR_ASSEMBLY_BEIGE   "#af9366"
#define COLOR_ASSEMBLY_BROWN   "#97670e"
#define COLOR_ASSEMBLY_GOLD    "#aa9100"
#define COLOR_ASSEMBLY_YELLOW  "#ceca2b"
#define COLOR_ASSEMBLY_GURKHA  "#999875"
#define COLOR_ASSEMBLY_LGREEN  "#789876"
#define COLOR_ASSEMBLY_GREEN   "#44843c"
#define COLOR_ASSEMBLY_LBLUE   "#5d99be"
#define COLOR_ASSEMBLY_BLUE    "#38559e"
#define COLOR_ASSEMBLY_PURPLE  "#6f6192"

#define COLOR_KINESIS_INDIGO	"#4d59db"
#define COLOR_KINESIS_INDIGO_PALE	"#9fa6f5"

#define COLOR_NECRO_YELLOW		"#FFFF00"
#define COLOR_NECRO_DARK_YELLOW		"#AAAA00"
#define COLOR_MARKER_RED		"#FF4444"
#define COLOR_HARVESTER_RED		rgb(255,68,68,128)
#define COLOR_BIOMASS_GREEN		"#82bf26"
#define COLOR_BIOLUMINESCENT_ORANGE "#ffb347"

// Codex category colours.
#define CODEX_COLOR_LORE      "#abdb9b"
#define CODEX_COLOR_MECHANICS "#9ebcd8"
#define CODEX_COLOR_ANTAG     "#e5a2a2"

#define COLOR_OOC	"#386aff"

#define RANDOM_RGB rgb(rand(0,255), rand(0,255), rand(0,255))

///Main colors for UI themes
#define COLOR_THEME_MIDNIGHT "#6086A0"
#define COLOR_THEME_ORANGE "#FFB200"
#define COLOR_THEME_OLD "#24CA00"
