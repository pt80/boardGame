extends Node2D

var tile_map = GameManager.tile_map
var player
var currentCell
@export var health: int = 5

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_area_2d_mouse_entered():
	print('iin')
	if !GameManager.holdingPiece:
		GameManager.currentPiece = self

func _on_area_2d_mouse_exited():
	print('out')
	if !GameManager.holdingPiece:
		GameManager.currentPiece = null
