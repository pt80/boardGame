extends CanvasLayer

@onready var health_stat = $MarginContainer/PanelContainer/GridContainer/healthStat
@onready var attack_stat = $MarginContainer/PanelContainer/GridContainer/attackStat
@onready var defense_stat = $MarginContainer/PanelContainer/GridContainer/defenseStat
@onready var speed_stat = $MarginContainer/PanelContainer/GridContainer/speedStat
@onready var nameLabel = $MarginContainer/PanelContainer/GridContainer/name
@onready var team = $MarginContainer/PanelContainer/GridContainer/teamBlank
@onready var grid = $"../TileMap"

func updateStats(unitStats):
	health_stat.text = str(unitStats['hp'])
	attack_stat.text = str(unitStats['attack'])
	defense_stat.text = str(unitStats['def'])
	speed_stat.text = str(unitStats['speed'])
	nameLabel.text = str(unitStats['name'])
	team.text = str(unitStats['team'])

func _on_button_pressed():
	GameManager.updateCurrentTurn()
	if GameManager.turnOrder[GameManager.currentTurnIndex][0] in GameManager.teams['team1'].keys():
		updateStats(GameManager.teams['team1'][GameManager.turnOrder[GameManager.currentTurnIndex][0]])
	else:
		updateStats(GameManager.teams['team2'][GameManager.turnOrder[GameManager.currentTurnIndex][0]])


func _on_move_button_pressed():
	GameManager.teams[team.text][nameLabel.text]['object'].move(GameManager.teams[team.text][nameLabel.text]['location'])
	#grid.findPath(GameManager.teams[team.text][nameLabel.text]['location'], )

