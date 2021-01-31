extends Node

# Defines a dictionary of game data.
var active_games = {}

var players = {}

#var active_games = {
#	"9457": { 
#		"player_data": {
#			3725973987259: { "name": "Jack", "traits": [ 0, 4, 2 ] },
#			4739573298579: { "name": "Michael", "traits": [ 6, 3, 1 ] }
#		},
#		"in_progress": false
#	}
#}


func create_lobby(player_id, player_name):
	var lobby_code = generate_lobby_code()
	
	while !is_lobby_code_valid(lobby_code):
		lobby_code = generate_lobby_code()
	
	active_games[lobby_code] = {
		"player_data": {},
		"in_progress": false
	}
	
	create_player(lobby_code, player_id, player_name)
	
	return lobby_code
	
	
func generate_lobby_code():
	var lobby_code = ""
	for _i in range(4):
		lobby_code += str(randi() % 10)
	
	return lobby_code


func is_lobby_code_valid(lobby_code):
	# Checks if the code is the correct length.
	if lobby_code.length() == 4:
		if !lobby_code_exists(lobby_code):
			return true

	return false


func lobby_code_exists(lobby_code):
	var matching = false
		
	# Loops through each lobby code.
	for code in active_games.keys():
		if lobby_code == code: # Checks if the lobby codes match.
			matching = true
			break
			
	return matching


func join_lobby(lobby_code, player_id, player_name):
	if lobby_code_exists(lobby_code):
		if !active_games[lobby_code]["in_progress"]:
		
			# Creates the player in the game data.
			create_player(lobby_code, player_id, player_name)
			
			# Gets all the player names.
			var player_data = active_games[lobby_code]["player_data"].values()
			
			# Prints that the player has been added.
			print("Player " + str(player_id) + " joined lobby " + lobby_code)
			
			# Returns the player names
			return player_data
			
		else:
			print("Player " + str(player_id) + " attempted to join game " + lobby_code + " which is in progress")
			return "Lobby is already in a game."
	
	print("Player " + str(player_id) + " attempted to join game " + lobby_code + " which doesn't exist")
	return "Lobby code doesn't exist"


func create_player(lobby_code, player_id, player_name):
	players[player_id] = lobby_code

	var alignment = randi() % 2
	var trait1 = randi() % 2 + (alignment * 2)
	var trait2 = randi() % 17 + 4
	
	var feat1 = randi() % 7
	var feat2 = randi() % 7
	var feat3 = randi() % 11
	
	active_games[lobby_code]["player_data"][player_id] = { 
		"name": player_name,
		"alignment": alignment,
		"features": [ feat1, feat2, feat3 ],
		"traits": [ trait1, trait2 ],
		"ready": false
	}


func start_game(lobby_code):
	active_games[lobby_code]["in_progress"] = true


func player_ready(lobby_code, player_id):
	active_games[lobby_code]["player_data"][player_id]["ready"] = true
	
	# Checks if all players are ready.
	var ready_players = 0
	for player_data in active_games[lobby_code]["player_data"].values():
		if player_data["ready"]:
			ready_players += 1
	
	if active_games[lobby_code]["player_data"].values().size() == ready_players:
		
		# Sets all players to not ready for the move onto the next day.
		for player_data in active_games[lobby_code]["player_data"].values():
			player_data["ready"] = false

		return true
	
	return false


func player_not_ready(lobby_code, player_id):
	active_games[lobby_code]["player_data"][player_id]["ready"] = false


func remove_player(player_id):
	var lobby_code = players[player_id]
	active_games[lobby_code]["player_data"].erase(player_id)
	players.erase(player_id)
	
	if active_games[lobby_code]["player_data"].keys().size() == 0:
		active_games.erase(lobby_code)
		print("Lobby" + lobby_code + " was closed")


func get_player_data(lobby_code, player_id):
	return active_games[lobby_code]["player_data"][player_id]
