extends CharacterBody2D

@onready var tile_map = $"../TileMap"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const stats = {
	'health': 100,
	'attack': 10,
	'defense':5
}


func moveCharacter():
	var mouseCoord = get_global_mouse_position()
	var adjCoord = Vector2(mouseCoord.x + 12, mouseCoord.y -6)
	if !tile_map.currentTile == null:
		global_position = Vector2(tile_map.currentTile) + Vector2(-8,12)
