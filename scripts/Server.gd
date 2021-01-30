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


func fetch_text(text_name, requester):
	rpc_id(1, "fetch_text", text_name, requester)


remote func return_text(s_text, requester):
	instance_from_id(requester).set_text(s_text)


func create_lobby():
	rpc_id(1, "request_create_lobby")


remote func return_lobby_code(s_code):
	GameData.lobby_code = s_code
	
	if get_tree().change_scene("res://Scenes/LobbyScreen.tscn") != OK:
		print("Failed to switch scenes to LobbyScreen")


func join_lobby(lobby_code):
	GameData.lobby_code = lobby_code
	
	rpc_id(1, "request_join_lobby", lobby_code)


remote func joined_lobby_successfully(player_names):
	GameData.player_names = player_names
	
	if get_tree().change_scene("res://Scenes/LobbyScreen.tscn") != OK:
		print("Failed to switch scenes to LobbyScreen")
	

remote func failed_to_join_lobby():
	GameData.lobby_code = ""
	
	print("Lobby doesn't exist")


func set_player_name(lobby_code, player_name):
	rpc_id(1, "set_player_name", lobby_code, player_name)
