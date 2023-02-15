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

enum environment {
	PRODUCTION,
	DEVELOPMENT,
}
global.ENVIRONMENT = environment.DEVELOPMENT


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

_sonar_buffer = 60
_direction_buffer = 180