extends Node

var network = NetworkedMultiplayerENet.new()
var ip = "127.0.0.1"
#var ip = "206.189.27.200"
var port = 1909


func _ready():
	connect_to_server()


func connect_to_server():
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	network.connect("connection_succeeded", self, "_on_connection_succeeded")
	network.connect("connection_failed", self, "_on_connection_failed")


func _on_connection_succeeded():
	print("Succesfully Connected")


func _on_connection_failed():
	print("Failed to Connect")


func create_lobby(player_name):
	GameData.player_names = [ player_name ]
	
	rpc_id(1, "request_create_lobby", player_name)


remote func return_lobby_code(s_code):
	GameData.lobby_code = s_code
	GameData.host = true
	
	if get_tree().change_scene("res://Scenes/LobbyScreen.tscn") != OK:
		print("Failed to switch scenes to LobbyScreen")


func join_lobby(lobby_code, player_name, requester):
	GameData.lobby_code = lobby_code
	
	rpc_id(1, "request_join_lobby", lobby_code, player_name, requester)


remote func joined_lobby_successfully(player_names):
	GameData.player_names = player_names
	GameData.host = false
	
	if get_tree().change_scene("res://Scenes/LobbyScreen.tscn") != OK:
		print("Failed to switch scenes to LobbyScreen")
	

remote func failed_to_join_lobby(error, requester):
	GameData.lobby_code = ""
	
	instance_from_id(requester).display_error(error)


func set_player_name(lobby_code, player_name):
	rpc_id(1, "set_player_name", lobby_code, player_name)


remote func player_joined_lobby(player_name):
	GameData.player_names.append(player_name)


func player_ready():
	rpc_id(1, "player_ready", GameData.lobby_code)


func player_not_ready():
	rpc_id(1, "player_not_ready", GameData.lobby_code)


remote func vote_started():
	GameData.game_scene.start_vote()


func start_game():
	rpc_id(1, "start_game", GameData.lobby_code)


remote func on_start_game():
	if get_tree().change_scene("res://Scenes/GameScreen.tscn") != OK:
		print("Failed to switch scenes to GameScreen")


func get_player_traits(name):
	rpc_id(1, "get_player_name", GameData.lobby_code, name)


remote func recieve_traits(traits):
	GameData.game_scene.get_traits(traits)
