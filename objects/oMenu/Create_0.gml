/// @description Create key variables

global.KEYBOARD_ROTATE_KEY = ord("Z")
// global.GAMEPAD_ROTATE_BUTTON = gp_shoulderlb

global.KEYBOARD_MOVE_KEY = ord("X")
// global.GAMEPAD_MOVE_BUTTON = gp_shoulderrb

global.KEYBOARD_SONAR_KEY = ord("C")
global.KEYBOARD_DIRECTION_KEY = ord("V")
global.KEYBOARD_HIDE_KEY = ord("B")

enum element_type {
	RUN_SCRIPT,
	CHANGE_PAGE,
	SLIDER,
	SHIFT,
	TOGGLE,
	INPUT,
}
enum pages {
	MAIN_MENU,
	MAIN_MENU_SETTINGS,
	MENU,
	MENU_SETTINGS,
}

ds_menu = create_menu([
	["PLAY",		element_type.RUN_SCRIPT,	start_game					],
	["INFORMATION",	element_type.RUN_SCRIPT,	play_tts_intro				],
	["SETTINGS",	element_type.CHANGE_PAGE,	pages.MAIN_MENU_SETTINGS	],
	["QUIT",		element_type.RUN_SCRIPT,	quit_game					],
	
])
ds_menu_settings = create_menu([
	["DIFFICULTY",	element_type.SHIFT,			change_difficulty,	0,			["EASY", "MEDIUM", "HARD", "EXTREME"]	],
	["BACK",		element_type.CHANGE_PAGE,	pages.MAIN_MENU,	undefined,	undefined								],
])

menu_pages = [
	ds_menu,
	ds_menu_settings,
]
menu_page = 0
menu_inputting = false

for (var i = 0; i < array_length(menu_pages); i++) {
	menu_selected_elements[i] = 0
}
