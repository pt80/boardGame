extends Node

var test

func _ready():
	test = preload("res://resources/cage.tres")
	print(test.health)
