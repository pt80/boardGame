extends Node2D

var tile_map = GameManager.tile_map
var player
var currentCell

func _process(delta):
	if Input.is_action_pressed('ui_accept'):
		var grid = tile_map.get_used_cells(0)
		for i in grid:
			var tile = tile_map.get_cell_tile_data(0,i)
			print(i, tile.get_custom_data('occupied'))
	
	if Input.is_action_pressed("click") && !GameManager.currentPiece == null:
		GameManager.holdingPiece = true
		GameManager.currentPiece.global_position = get_global_mouse_position()

	elif Input.is_action_just_released("click") && GameManager.holdingPiece:
		var mapPos = tile_map.local_to_map(get_global_mouse_position())
		var prevTile = tile_map.get_cell_tile_data(0,GameManager.currentPiece.currentCell)
		var tile = tile_map.get_cell_tile_data(0,mapPos)
		if !tile.get_custom_data("occupied"):
			prevTile.set_custom_data("occupied", false)
			tile.set_custom_data("occupied", true)
			GameManager.currentPiece.global_position = tile_map.map_to_local(mapPos)
			GameManager.currentPiece.currentCell = mapPos
			GameManager.holdingPiece = false
		else:
			GameManager.currentPiece.global_position = tile_map.map_to_local(GameManager.currentPiece.currentCell)
			GameManager.holdingPiece = false

func _on_area_2d_mouse_entered():
	if !GameManager.holdingPiece:
		GameManager.currentPiece = self

func _on_area_2d_mouse_exited():
	if !GameManager.holdingPiece:
		GameManager.currentPiece = null
