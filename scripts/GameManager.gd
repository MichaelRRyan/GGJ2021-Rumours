extends Node

# Defines a dictionary of game data.
var active_games = {}


#var active_games = {
#	"9457": { 
#		"player_data": {
#			3725973987259: { "name": "Jack", "traits": [ 0, 4, 2 ] },
#			4739573298579: { "name": "Michael", "traits": [ 6, 3, 1 ] }
#		}
#	}
#}


func create_lobby(player_id):
	var lobby_code = generate_lobby_code()
	
	while !is_lobby_code_valid(lobby_code):
		lobby_code = generate_lobby_code()
	
	active_games[lobby_code] = {
		"player_data": {}
	}
	
	create_player(lobby_code, player_id)
	
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


func join_lobby(lobby_code, player_id):
	if lobby_code_exists(lobby_code):
		var player_data = active_games[lobby_code]["player_data"].values()
		var player_names = []
		
		for data in player_data:
			player_names.append(data["name"])
		
		create_player(lobby_code, player_id)
		
		print("Player " + str(player_id) + " joined lobby " + lobby_code)
		return player_names
		
	return null


func create_player(lobby_code, player_id):
	active_games[lobby_code]["player_data"][player_id] = { 
		"name": "", "traits": []
	}


func set_player_name(lobby_code, player_id, player_name):
	active_games[lobby_code]["player_data"][player_id]["name"] = player_name
