extends Node

const text_data = { "name": "Michael", "skill": 100 }


var network = NetworkedMultiplayerENet.new()
var port = 1909
var max_players = 100

func _ready():
	start_server()
	
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


remote func fetch_text(text_name, requester):
	var player_id = get_tree().get_rpc_sender_id()
	var text = text_data[text_name]
	rpc_id(player_id, "return_text", text, requester)
	print("Sending " + str(text) + " to player " + str(player_id))
