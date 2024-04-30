extends Node2D
@onready var tile_map = $"."


const PIECE = preload("res://scenes/piece.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	print('lets go!')
	var grid = tile_map.get_used_cells(0)
	var d = tile_map.local_to_map(global_position)
	print(d)
	for i in grid:
		var c = PIECE.instantiate()
		add_child(c)
		c.global_position = tile_map.map_to_local(i)
		print(i)

		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
