extends Node

var network = NetworkedMultiplayerENet.new()
var port = 1909
var max_players = 100


func _ready():
	start_server()
	randomize()
	
	
func start_server():
	network.create_server(port, max_players)
	get_tree().set_network_peer(network)
	print("Server Started")
	
	network.connect("peer_connected", self, "_peer_connected")
	network.connect("peer_disconnected", self, "_peer_disconnected")


func _peer_connected(player_id):
	print("User " + str(player_id) + " Connected")


func _peer_disconnected(player_id):
	print("User " + str(player_id) + " Disconnected")


# ------------- Functionality -----------------------
remote func request_create_lobby(player_name):
	var player_id = get_tree().get_rpc_sender_id()
	var lobby_code = GameManager.create_lobby(player_id, player_name)
	
	rpc_id(player_id, "return_lobby_code", lobby_code)
	print("Lobby created with code " + lobby_code + " by player " + str(player_id))


remote func request_join_lobby(lobby_code, player_name, requester):
	var player_id = get_tree().get_rpc_sender_id()
	var result = GameManager.join_lobby(lobby_code, player_id, player_name)

	if typeof(result) == TYPE_STRING:
		rpc_id(player_id, "failed_to_join_lobby", result, requester)
	else:
		rpc_id(player_id, "joined_lobby_successfully", result)
		
		for id in GameManager.active_games[lobby_code]["player_data"].keys():
			if id != player_id:
				rpc_id(id, "player_joined_lobby", player_name)
