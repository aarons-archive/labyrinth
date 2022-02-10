/// @description Create key variables

//////////////
// Globals //
////////////

enum difficulty {
	EASY,
	MEDIUM,
	HARD,
}
global.DIFFICULTY = difficulty.EASY

global.KEYBOARD_ROTATE_KEY = ord("A")
// global.GAMEPAD_ROTATE_BUTTON = gp_shoulderlb
global.KEYBOARD_MOVE_KEY = ord("D")
// global.GAMEPAD_MOVE_BUTTON = gp_shoulderrb

global.TILE_LENGTH = 50

//////////////////////
// Player-specific //
////////////////////

enum Direction {
	UP = 0,
	LEFT = 1,
	DOWN = 2,
	RIGHT = 3,
}

_direction = Direction.UP
_sound_buffer = 100