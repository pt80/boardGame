extends Node2D
@onready var tile_map = $"."
const BLACKPAWN = preload("res://images/blackpawn.png")
const WHITEPAWN = preload("res://images/whitepawn.png")
const PIECE = preload("res://scenes/piece.tscn")
const BLACK_BISHOP = preload("res://images/blackBishop.png")
const BLACK_HORSE = preload("res://images/blackHorse.png")
const BLACK_ROOK = preload("res://images/blackRook.png")
const WHITE_BISHOP = preload("res://images/whiteBishop.png")
const WHITE_HORSE = preload("res://images/whiteHorse.png")
const WHITE_ROOK = preload("res://images/whiteRook.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	var grid = tile_map.get_used_cells(0)
	for i in grid:
		if i.y == 1:
			createPiece(BLACKPAWN, i)
			#GameManager.blackPieces.append(c)
		elif i.y == 0 && i.x in [0,7]:
			createPiece(BLACK_ROOK, i)
		elif i.y == 0 && i.x in [1,6]:
			createPiece(BLACK_HORSE, i)
		elif i.y == 0 && i.x in [2,5]:
			createPiece(BLACK_BISHOP, i)
		
		

		elif i.y == 6:
			createPiece(WHITEPAWN, i)
		elif i.y == 7 && i.x in [0,7]:
			createPiece(WHITE_ROOK, i)
		elif i.y == 7 && i.x in [1,6]:
			createPiece(WHITE_HORSE, i)
		elif i.y == 7 && i.x in [2,5]:
			createPiece(WHITE_BISHOP, i)
			#GameManager.whitePieces.append(c)
			
func createPiece(texture, location):
	var c = PIECE.instantiate()
	add_child(c)
	c.get_node("Sprite2D").texture = texture
	c.global_position = tile_map.map_to_local(location)
	var tile = tile_map.get_cell_tile_data(0,location)
	tile.set_custom_data("occupied", true)
