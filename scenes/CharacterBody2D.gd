extends CharacterBody2D

@onready var tile_map = $"../TileMap"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _input(event):
	if event.is_action_pressed("left_click"):
		var mouseCoord = get_global_mouse_position()
		var adjCoord = Vector2(mouseCoord.x + 12, mouseCoord.y -6)
		print(tile_map.currentTile)
		if !tile_map.currentTile == null:
			global_position = Vector2(tile_map.currentTile) + Vector2(-8,12)
<<<<<<< HEAD
			print('here')
			asdfdfasd
=======
>>>>>>> parent of 18b192e (test)
