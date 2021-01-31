extends Control

var player_count = 0

func _ready():
	$LobbyNumber.text = GameData.lobby_code

	if GameData.player_names:
		for name in GameData.player_names:
			add_player_name(name)
			player_count += 1


func _process(_delta):
	if GameData.player_names.size() > player_count:
		for i in range(player_count, GameData.player_names.size()):
			add_player_name(GameData.player_names[i])
		player_count = GameData.player_names.size()


func add_player_name(name):
	var name_label = Label.new()
	name_label.text = name
	name_label.add_font_override("font", load("res://assets/fonts/Valera32.tres"))
	$PlayerList.add_child(name_label)
