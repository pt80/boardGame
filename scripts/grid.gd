extends TileMap
@onready var unit = $"../CharacterBody2D"
@onready var UI = $"../CanvasLayer"

const gridSize = 150
var gridDict = {}
var currentTile
var astarGrid
var astarEnd
const unitPiece = preload("res://scenes/piece.tscn")

func _ready():
	GameManager.tileMap = self
	buildTerrain(0, Vector2i(0,0), 'ground')
	buildTerrain(1, Vector2i(3,0), 'soil')
	buildTerrain(2, Vector2i(2,0), 'grass')
	setupAstar()
	
func setupAstar():
	astarGrid = AStarGrid2D.new()
	astarGrid.region = get_used_rect()
	astarGrid.cell_size = Vector2(24,12)
	astarGrid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astarGrid.update()

func _input(event):
	if event.is_action_pressed("left_click"):
		var tile = local_to_map(adjMouseCoords())
		print(tile)
		currentTile = tile
		#unit.moveCharacter()
		#UI.updateStats(unit.stats)
		#if get_cell_tile_data(0, tile) == null:
			#set_cell(0, tile, 2, Vector2i(0,0), 0)
		#elif get_cell_tile_data(1, tile) == null:
			#set_cell(1, tile, 2, Vector2i(0,0), 0)
		#elif get_cell_tile_data(2, tile) == null:
			#set_cell(2, tile, 2, Vector2i(0,0), 0)
		
	if event.is_action_pressed("middle_click"):
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
		
func findPath(start = Vector2(0,0), end = currentTile):
	print('start ', start, ', end ', end)
	var path = astarGrid.get_id_path(start,	end)
	print('this is the path' , path[path.size()-1])
	astarEnd = path[path.size()-1]
	for i in path:
		set_cell(2, i, 2, Vector2i(0,1), 0)
		#erase_cell(2, i)
		
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

func addUnits():
	for i in GameManager.teams['team1'].keys():
		var instance = unitPiece.instantiate()
		add_child(instance)
		GameManager.teams['team1'][i]['object'] = instance
		instance.setStats(GameManager.teams['team1'][i])
		instance.setTexture(CharacterData.units[i]['image'])
		instance.global_position = map_to_local(GameManager.teams['team1'][i]['location'])
	for i in GameManager.teams['team2'].keys():
		var instance = unitPiece.instantiate()
		add_child(instance)
		instance.setTexture(CharacterData.units[i]['image'])
		GameManager.teams['team2'][i]['object'] = instance
		instance.setStats(GameManager.teams['team2'][i])
		instance.global_position = map_to_local(GameManager.teams['team2'][i]['location'])

