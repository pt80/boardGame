extends Node2D

var tileMap = GameManager.tileMap
var player
var currentCell
@onready var sprite = $Sprite2D
@onready var UI = $"../../CanvasLayer"


func _ready():
	pass
	
func setTexture(image):
	sprite.texture = load(image)
	
func setStats(stats):
	print(stats)

func start(name):
	if name in GameManager.teams['team1'].keys():
		print('unit name is ', GameManager.teams['team1'][name])
		UI.updateStats(GameManager.teams['team1'][name])
	else:
		print('unit name is ', GameManager.teams['team2'][name])
		UI.updateStats(GameManager.teams['team2'][name])
	
func move(location):
	tileMap.findPath(location, tileMap.local_to_map(get_global_mouse_position()))
	position = tileMap.map_to_local(Vector2(tileMap.astarEnd[0],tileMap.astarEnd[1]))

	
func _process(delta):
	if Input.is_action_pressed("right_click"):
		print(tileMap)
		#move()
	#if Input.is_action_pressed('ui_accept'):
		#var grid = tile_map.get_used_cells(0)
		#for i in grid:
			#var tile = tile_map.get_cell_tile_data(0,i)
			#print(i, tile.get_custom_data('occupied'))
	
	if Input.is_action_pressed("left_click") && GameManager.currentPiece == self:
		UI.updateStats({'health':1,'attack':2,'defense':3})
		#GameManager.holdingPiece = true
		#GameManager.currentPiece.global_position = get_global_mouse_position()
#
	#elif Input.is_action_just_released("click") && GameManager.holdingPiece:
		#var mapPos = tile_map.local_to_map(get_global_mouse_position())
		#var prevTile = tile_map.get_cell_tile_data(0,GameManager.currentPiece.currentCell)
		#var tile = tile_map.get_cell_tile_data(0,mapPos)
		#if !tile.get_custom_data("occupied"):
			#prevTile.set_custom_data("occupied", false)
			#tile.set_custom_data("occupied", true)
			#GameManager.currentPiece.global_position = tile_map.map_to_local(mapPos)
			#GameManager.currentPiece.currentCell = mapPos
			#GameManager.holdingPiece = false
		#else:
			#GameManager.currentPiece.global_position = tile_map.map_to_local(GameManager.currentPiece.currentCell)
			#GameManager.holdingPiece = false

func _on_area_2d_mouse_entered():
	if !GameManager.holdingPiece:
		GameManager.currentPiece = self

func _on_area_2d_mouse_exited():
	if !GameManager.holdingPiece:
		GameManager.currentPiece = null
