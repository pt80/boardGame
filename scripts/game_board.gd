extends Node2D

@onready var grid = $TileMap

func _ready():
	GameManager.setTurnOrder()
	grid.addUnits()
	GameManager.beginTurn()

	
	


