extends Node

var holdingPiece = false
var currentTurn = "team1"
var currentPiece 
var tile_map

var teams = {
	'team1':{},
	'team2':{}
}
var turnOrder = []
var spawnPoints = [Vector2(0,3),Vector2(0,5),Vector2(0,7)]

func addToTeam(team,unit):
	team[unit['name']] = unit
	

func setTurnOrder():
	var unitKeys = GameManager.teams['team2'].keys() + GameManager.teams['team1'].keys()
	for i in unitKeys:
		GameManager.turnOrder.append([i,CharacterData.units[i]['hp']])
	GameManager.turnOrder.sort_custom(sort_ascending)
	
func sort_ascending(a, b):
	if a[1] < b[1]:
		return true
	return false
