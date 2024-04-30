extends Node

var holdingPiece = false
var currentTurn = "white"
var currentPiece 
var blackPieces = []
var whitePieces = []
@onready var tile_map = $TileMap
