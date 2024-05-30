extends Node

var holdingPiece = false
var currentTurn = "team1"
var currentPiece 
var tile_map

var teams = {
	'team1':{},
	'team2':{}
}
var team1 = {}
var team2 = {}

func addToTeam(team,unit):
	team[unit['name']] = unit
	
