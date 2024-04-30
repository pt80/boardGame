extends Node2D

var tile_map = GameManager.tile_map
var player


func _process(delta):
	if Input.is_action_pressed("click") && !GameManager.currentPiece == null:
		GameManager.holdingPiece = true
		GameManager.currentPiece.global_position = get_global_mouse_position()
		print(tile_map)
	elif Input.is_action_just_released("click") && GameManager.holdingPiece:
		print(global_position)
		global_position = tile_map.map_to_local(global_position)
		var tile = tile_map.get_cell_tile_data(0,global_position)
		tile.set_custom_data("occupied", true)
		GameManager.holdingPiece = false

func _on_area_2d_mouse_entered():
	if !GameManager.holdingPiece:
		GameManager.currentPiece = self

func _on_area_2d_mouse_exited():
	if !GameManager.holdingPiece:
		GameManager.currentPiece = null
