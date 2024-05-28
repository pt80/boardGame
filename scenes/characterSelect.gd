extends Control

@onready var timer_label = $CanvasLayer/timerLabel
@onready var character_select = $CanvasLayer/characterSelect
@onready var selected_info = $CanvasLayer/selectedInfo
@onready var selected_image = $CanvasLayer/selectedInfo/selectedImage

var selectionTime = 30

func _ready():
	for i in CharacterData.units:
		var image = TextureButton.new()
		image.texture_normal = load(CharacterData.units[i]['image'])
		character_select.add_child(image)
		image.connect("pressed", updateSelectedUnit.bind(i))
		print(CharacterData.units[i]['image'])
	
func updateSelectedUnit(selected):
	print(selected)
	selected_image.texture = load(CharacterData.units[selected]['image'])
	
func _on_timer_timeout():
	selectionTime -= 1
	if selectionTime == 0:
		selectionTime = 30
	timer_label.text = str(selectionTime)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")


