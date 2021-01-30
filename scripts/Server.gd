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


remote func request_create_lobby():
	var player_id = get_tree().get_rpc_sender_id()
	var lobby_code = GameManager.create_lobby(player_id)
	
	rpc_id(player_id, "return_lobby_code", lobby_code)
	print("Lobby created with code " + lobby_code + " by player " + str(player_id))


remote func request_join_lobby(lobby_code):
	var player_id = get_tree().get_rpc_sender_id()
	var result = GameManager.join_lobby(lobby_code, player_id)

	if result:
		rpc_id(player_id, "joined_lobby_successfully", result)
	else:
		rpc_id(player_id, "failed_to_join_lobby")


remote func set_player_name(lobby_code, player_name):
	var player_id = get_tree().get_rpc_sender_id()
	GameManager.set_player_name(lobby_code, player_id, player_name)
