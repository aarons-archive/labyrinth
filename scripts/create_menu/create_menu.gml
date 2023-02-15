function create_menu(elements) {
	
	var width = 0;
	for (var i = 0; i < array_length(elements); i++) {
		width = max(width, array_length(elements[i]))
	}
	var height = array_length(elements)

	var ds_grid = ds_grid_create(width, height)
	
	for (var _x = 0; _x < height; _x++) {
		for (var _y = 0; _y < width; _y++) {
			ds_grid[# _y, _x] = elements[_x, _y] 
		}
	}
	
	return ds_grid
}
