/// @description Create key variables

global.TILE_LENGTH = 50

global.KEYBOARD_ROTATE_KEY = ord("A")
// global.GAMEPAD_ROTATE_BUTTON = gp_shoulderlb

global.KEYBOARD_MOVE_KEY = ord("D")
// global.GAMEPAD_MOVE_BUTTON = gp_shoulderrb

enum Direction {
	UP = 0,
	LEFT = 1,
	DOWN = 2,
	RIGHT = 3,
}

_direction = Direction.UP