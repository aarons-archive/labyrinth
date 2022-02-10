/// @description Create key variables

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
