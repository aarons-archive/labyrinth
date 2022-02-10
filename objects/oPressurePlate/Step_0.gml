/// @description Logic

if (place_meeting(x, y, oPlayer) and not _pressed) {
	audio_play_sound(soundError, 0, false) 
	_pressed = true
	image_index = 1
}
