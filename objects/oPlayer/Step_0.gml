/// @description Movement logic


//////////////
// Gamepad //
////////////

/*
var _gamepad_slot = 0

for (var i = 0; i < gamepad_get_device_count(); i++;) {
	if (gamepad_is_connected(i)) { 
		var _gamepad_slot = i 
		break
	}
}
*/


////////////
// Sonar //
//////////

function scan(direction) {
	
	var _tiles = 0
	
	while (true) {
		
		var _check
		
		if (direction == "forward") {
			if		(_direction == Direction.UP		) { _check = place_meeting(x, y - ((_tiles + 1) * 50), oWall) }
			else if (_direction == Direction.LEFT	) { _check = place_meeting(x - ((_tiles + 1) * 50), y, oWall) }
			else if (_direction == Direction.DOWN	) { _check = place_meeting(x, y + ((_tiles + 1) * 50), oWall) }
			else if (_direction == Direction.RIGHT	) { _check = place_meeting(x + ((_tiles + 1) * 50), y, oWall) }
		}
		else if (direction == "left") {
			if		(_direction == Direction.UP		) { _check = place_meeting(x - ((_tiles + 1) * 50), y, oWall) }
			else if (_direction == Direction.LEFT	) { _check = place_meeting(x, y + ((_tiles + 1) * 50), oWall) }
			else if (_direction == Direction.DOWN	) { _check = place_meeting(x + ((_tiles + 1) * 50), y, oWall) }
			else if (_direction == Direction.RIGHT	) { _check = place_meeting(x, y - ((_tiles + 1) * 50), oWall) }
		}
		else if (direction == "right") {
			if		(_direction == Direction.UP		) { _check = place_meeting(x + ((_tiles + 1) * 50), y, oWall) }
			else if (_direction == Direction.LEFT	) { _check = place_meeting(x, y - ((_tiles + 1) * 50), oWall) }
			else if (_direction == Direction.DOWN	) { _check = place_meeting(x - ((_tiles + 1) * 50), y, oWall) }
			else if (_direction == Direction.RIGHT	) { _check = place_meeting(x, y + ((_tiles + 1) * 50), oWall) }
		}

		if (_check) {
			return _tiles
		}
		_tiles += 1
	}
}

if (
	_sonar_buffer == 0 
	or (keyboard_check_pressed(global.KEYBOARD_SONAR_KEY) and global.ENVIRONMENT == environment.DEVELOPMENT)
) {
	
	_sonar_buffer = 60
	
	var _left_tiles = scan("left")
	var _right_tiles = scan("right")
	
	if (_left_tiles != 0) { 
		audio_sound_gain(sound_left_sonar, (1 / _left_tiles), 0) 
		audio_play_sound(sound_left_sonar, 0, false) 
	}
    if (_right_tiles != 0)	{
		audio_sound_gain(sound_right_sonar, (1 / _right_tiles), 0) 
		audio_play_sound(sound_right_sonar, 0, false) 
	}
	
} 
else { _sonar_buffer -= 1 }


////////////////
// Direction //
//////////////

if (
	(_direction_buffer == 0 and global.DIFFICULTY == difficulty.EASY)
	or 
	(keyboard_check_pressed(global.KEYBOARD_DIRECTION_KEY) and global.ENVIRONMENT == environment.DEVELOPMENT)
) {
	
	_direction_buffer = 180
	
	switch _direction {
		case Direction.UP:
			audio_play_sound(sound_tts_up, 0, false)
			break
		case Direction.RIGHT:
			audio_play_sound(sound_tts_right, 0, false)
			break
		case Direction.DOWN:
			audio_play_sound(sound_tts_down, 0, false)
			break
		case Direction.LEFT:
			audio_play_sound(sound_tts_left, 0, false)
			break		
	}
	
} 
else { _direction_buffer -= 1 }


///////////////
// Rotation //
/////////////

if (
	keyboard_check_pressed(global.KEYBOARD_ROTATE_KEY) 
	// or gamepad_button_check_pressed(_gamepad_slot, global.GAMEPAD_ROTATE_BUTTON)
) {
	switch _direction {
		case Direction.UP:
			_direction = Direction.RIGHT
			image_angle = 270
			break
		case Direction.RIGHT:
			_direction = Direction.DOWN
			image_angle = 180
			break
		case Direction.DOWN:
			_direction = Direction.LEFT
			image_angle = 90
			break
		case Direction.LEFT:
			_direction = Direction.UP
			image_angle = 0
			break		
	}
}


///////////////
// Movement //
/////////////

var _horizontal_distance = 0
var _vertical_distance = 0
 
if (
	keyboard_check_pressed(global.KEYBOARD_MOVE_KEY) 
	// or gamepad_button_check_pressed(_gamepad_slot, global.GAMEPAD_MOVE_BUTTON)
) {
	
	// Move
	switch _direction {
		case Direction.UP:
			_vertical_distance = -50
			break
		case Direction.LEFT:
			_horizontal_distance = -50
			break
		case Direction.DOWN:
			_vertical_distance = 50
			break
		case Direction.RIGHT:
			_horizontal_distance = 50
			break	
	}
	
	// Check horizontal collisions
	if (place_meeting(x + _horizontal_distance, y, oWall)) {
		while (not place_meeting(x + sign(_horizontal_distance), y,  oWall)) {
			x += sign(_horizontal_distance)
		}
		_horizontal_distance = 0
		audio_play_sound(sound_move_unavailable, 0, false)
		// gamepad_set_vibration(_gamepad_slot, 1, 1);
	}
	x += _horizontal_distance

	// Check vertical collisions
	if (place_meeting(x, y + _vertical_distance,  oWall)) {
		while (not place_meeting(x, y + sign(_vertical_distance),  oWall)) {
			y += sign(_vertical_distance)
		}
		_vertical_distance = 0
		audio_play_sound(sound_move_unavailable, 0, false)
		// gamepad_set_vibration(_gamepad_slot, 1, 1);
	}
	y += _vertical_distance
}