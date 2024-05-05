extends TileMap

const gridSize = 4
var gridDict = {}
var currentTile

func _ready():
	buildTerrain(0, Vector2i(0,0), 'ground')
	buildTerrain(1, Vector2i(3,0), 'soil')
	buildTerrain(2, Vector2i(2,0), 'grass')

func _input(event):
	if event.is_action_pressed("left_click"):
		var tile = local_to_map(adjMouseCoords())
		currentTile = map_to_local(tile)
		if get_cell_tile_data(0, tile) == null:
			set_cell(0, tile, 2, Vector2i(0,0), 0)
		elif get_cell_tile_data(1, tile) == null:
			set_cell(1, tile, 2, Vector2i(0,0), 0)
		elif get_cell_tile_data(2, tile) == null:
			set_cell(2, tile, 2, Vector2i(0,0), 0)
		
	if event.is_action_pressed("right_click"):
		var tile = local_to_map(adjMouseCoords())
		if !get_cell_tile_data(2, tile) == null:
			erase_cell(2, tile)
			#print(get_cell_tile_data(2, tile).get_custom_data('terrain'))
		elif !get_cell_tile_data(1, tile) == null:
			erase_cell(1, tile)
			#print(get_cell_tile_data(1, tile).get_custom_data('terrain'))
		elif !get_cell_tile_data(0, tile) == null:
			erase_cell(0, tile)
			#print(get_cell_tile_data(0, tile).get_custom_data('terrain'))
		

func adjMouseCoords():
	var mouseCoord = get_global_mouse_position()
	return Vector2(mouseCoord.x + 12, mouseCoord.y -6)

func buildTerrain(layer, tile, type):
	for x in gridSize:
		for y in gridSize:
			gridDict[str(Vector2(x,y))] = {
				"type": type,
				"occupying_unit": ""
			}
			set_cell(layer, Vector2(x,y),2, tile, 0)