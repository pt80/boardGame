extends CanvasLayer

@onready var health_stat = $MarginContainer/PanelContainer/GridContainer/healthStat
@onready var attack_stat = $MarginContainer/PanelContainer/GridContainer/attackStat
@onready var defense_stat = $MarginContainer/PanelContainer/GridContainer/defenseStat


func updateStats(unitStats):
	health_stat.text = str(unitStats['health'])
	attack_stat.text = str(unitStats['attack'])
	defense_stat.text = str(unitStats['defense'])
