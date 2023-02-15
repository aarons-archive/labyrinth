/// @description Logic

if (place_meeting(x, y, oPlayer) and not _pressed) {
	audio_play_sound(sound_pressure_plate_activate, 0, false) 
	_pressed = true
	image_index = 1
}
