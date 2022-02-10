/// @description Draw menu

draw_set_font(fMenu)		// Set font
draw_set_halign(fa_left)	// Horizontal font alignment
draw_set_valign(fa_top)		// Vertical font alignment

// Main sprite
var _menu_start_x = 20
var _menu_start_y = 20
var _menu_end_x = (room_width - (_menu_start_x * 2)) / sprite_width
var _menu_end_y = (room_height - (_menu_start_y * 2)) / sprite_height

draw_sprite_ext(
    sprite_index, image_index, 
	_menu_start_x, _menu_start_y,
	_menu_end_x, _menu_end_y,
	0, c_white, 1,
)


// Menu state
var _menu = menu_pages[menu_page]
var _menu_height = ds_grid_height(_menu)


// Menu options
var _option_offset_y = 40
var _option_start_x = _menu_start_x * 2
var _option_start_y = (room_height / 2) - ((_menu_height * _option_offset_y) / 2)

var _shift_option_offset = 200

for (var i = 0; i < _menu_height; i++) {
	
	// Option name
	if (menu_selected_elements[menu_page] == i) { draw_set_color(c_yellow) } else { draw_set_color(c_white) }
	draw_text(
		_option_start_x, 
		_option_start_y + (i * _option_offset_y), 
		_menu[# 0, i], 
	)
	
	// Option type
	switch (_menu[# 1, i]) {

		// Shift element
		case element_type.SHIFT:
			
			// Set colour depending on current operation
			if (menu_selected_elements[menu_page] == i) { 
				if (menu_inputting) { 
					var colour = c_lime 
				} else { 
					var colour = c_white 
				} 
			} else { 
				var colour = c_grey 
			}
			
			var current_value = _menu[# 3, i]
			
			// Set correct marker for position in shift element
			if (current_value != 0) { var left_shift = "<<" } else { var left_shift = "" } 
			if (current_value != array_length(_menu[# 4, i]) - 1) { var right_shift = ">>" } else { var right_shift = "" }
			
			// Draw shift element
			draw_text_color(
				_option_start_x + _shift_option_offset
				, 
				_option_start_y + (i * _option_offset_y), 
				left_shift + _menu[# 4, i][current_value] + right_shift,
				colour, colour, colour, colour, 
				1
			)
			break
	}
}