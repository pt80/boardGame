extends CanvasLayer

@onready var health_stat = $MarginContainer/PanelContainer/GridContainer/healthStat
@onready var attack_stat = $MarginContainer/PanelContainer/GridContainer/attackStat
@onready var defense_stat = $MarginContainer/PanelContainer/GridContainer/defenseStat
@onready var speed_stat = $MarginContainer/PanelContainer/GridContainer/speedStat

func updateStats(unitStats):
	health_stat.text = str(unitStats['hp'])
	attack_stat.text = str(unitStats['attack'])
	defense_stat.text = str(unitStats['def'])
	speed_stat.text = str(unitStats['speed'])


func _on_button_pressed():
	GameManager.updateCurrentTurn()
	updateStats(CharacterData.units[GameManager.turnOrder[GameManager.currentTurnIndex][0]])
