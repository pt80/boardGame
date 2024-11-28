extends Node

var holdingPiece = false
var currentTurn = "team1"
var currentUnitTurn: String 
var currentPiece 
var tileMap
var unitKeys
var currentTurnIndex = 0
var spawnIndex = 0
var teams = {
	'team1':{},
	'team2':{}
}
var turnOrder = []
var spawnPoints = [Vector2(0,3),Vector2(10,3),Vector2(0,5),Vector2(10,5),Vector2(0,7),Vector2(10,7)]

func addToTeam(team,unit):
	team[unit['name']] = {}
	team[unit['name']]['location'] = spawnPoints[spawnIndex]
	team[unit['name']]['hp'] = unit['hp']
	team[unit['name']]['def'] = unit['def']
	team[unit['name']]['attack'] = unit['attack']
	team[unit['name']]['speed'] = unit['speed']
	team[unit['name']]['move'] = unit['move']
	team[unit['name']]['name'] = unit['name']
	team[unit['name']]['team'] = currentTurn
	print(team[unit['name']])
	spawnIndex += 1

func setTurnOrder():
	unitKeys = teams['team2'].keys() + teams['team1'].keys()
	for unit in unitKeys:
		turnOrder.append([unit,CharacterData.units[unit]['speed']])
	turnOrder.sort_custom(sortDesc)

func sortDesc(a, b):
	if a[1] > b[1]:
		return true
	return false

func updateCurrentTurn():
	currentTurnIndex += 1
	if currentTurnIndex > turnOrder.size()-1:
		currentTurnIndex = 0
	beginTurn()
		
func beginTurn():
	currentUnitTurn = turnOrder[currentTurnIndex][0]
	if turnOrder[currentTurnIndex][0] in teams['team1'].keys():
		print('begin ', turnOrder[currentTurnIndex][0])
		teams['team1'][currentUnitTurn]['object'].start(currentUnitTurn)
	else:
		print('begin ', turnOrder[currentTurnIndex][0])
		teams['team2'][currentUnitTurn]['object'].start(currentUnitTurn)
