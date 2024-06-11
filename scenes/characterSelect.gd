extends Control

@onready var timer_label = $CanvasLayer/timerLabel
@onready var character_select = $CanvasLayer/characterSelect
@onready var selected_info = $CanvasLayer/selectedInfo
@onready var selected_image = $CanvasLayer/selectedInfo/selectedImage
@onready var hp = $CanvasLayer/selectedInfo/selectedStats/HP
@onready var attack = $CanvasLayer/selectedInfo/selectedStats/attack
@onready var defense = $CanvasLayer/selectedInfo/selectedStats/defense
@onready var selectName = $CanvasLayer/selectedInfo/selectedStats/name
@onready var white1 = $CanvasLayer/panelLeft/teamLeft/unit1/unitImage
@onready var white2 = $CanvasLayer/panelLeft/teamLeft/unit2/unitImage
@onready var white3 = $CanvasLayer/panelLeft/teamLeft/unit3/unitImage
@onready var black1 = $CanvasLayer/panelRight/teamRight/unit1/unitImage
@onready var black2 = $CanvasLayer/panelRight/teamRight/unit2/unitImage
@onready var black3 = $CanvasLayer/panelRight/teamRight/unit3/unitImage
@onready var white1name = $CanvasLayer/panelLeft/teamLeft/unit1/unitName
@onready var white2name = $CanvasLayer/panelLeft/teamLeft/unit2/unitName
@onready var white3name = $CanvasLayer/panelLeft/teamLeft/unit3/unitName
@onready var black1name = $CanvasLayer/panelRight/teamRight/unit1/unitName
@onready var black2name = $CanvasLayer/panelRight/teamRight/unit2/unitName
@onready var black3name = $CanvasLayer/panelRight/teamRight/unit3/unitName

var selectedUnits = [null,null,null,null,null,null]
var teamIcons = []
var teamUnitNames = []
var currentTurn = 0
var selectionTime = 30


func _ready():
	teamIcons = [white1,black1,white2,black2,white3,black3]
	teamUnitNames = [white1name,black1name,white2name,black2name,white3name,black3name]
	for i in CharacterData.units:
		var image = TextureButton.new()
		image.texture_normal = load(CharacterData.units[i]['image'])
		character_select.add_child(image)
		image.connect("pressed", updateSelectedUnit.bind(image,i))

func updateSelectedUnit(button, selected):
	selected_image.texture = load(CharacterData.units[selected]['image'])
	hp.text = str(CharacterData.units[selected]['hp'])
	attack.text = str(CharacterData.units[selected]['attack'])
	defense.text = str(CharacterData.units[selected]['def'])
	selectName.text = selected
	button.disabled = true
	
func _on_timer_timeout():
	selectionTime -= 1
	if selectionTime == 0:
		selectionTime = 30
	timer_label.text = str(selectionTime)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
	
func _on_select_pressed():
	if selectName.text != 'sara':
		selectionTime = 30
		var team = GameManager.teams[GameManager.currentTurn]
		GameManager.addToTeam(team,CharacterData.units[selectName.text])
		selectedUnits[currentTurn] = selectName.text
		updateTeamIcons()
		switchTeams()
		currentTurn += 1
		resetSelectedUnit()
		if currentTurn > 5:
			get_tree().change_scene_to_file("res://scenes/game_board.tscn")

func resetSelectedUnit():
	selectName.text = 'sara'
	hp.text = '???'
	attack.text = '???'
	defense.text = '???'
	selected_image.texture = load("res://images/testUnit.png")

func updateTeamIcons():
	var counter = 0
	for i in selectedUnits:
		if i != null:
			teamIcons[counter].texture = load(CharacterData.units[i]['image'])
			teamUnitNames[counter].text = i
		counter+=1
	
func switchTeams():
	if GameManager.currentTurn == 'team1':
		GameManager.currentTurn = 'team2'
	elif GameManager.currentTurn == 'team2':
		GameManager.currentTurn = 'team1'
