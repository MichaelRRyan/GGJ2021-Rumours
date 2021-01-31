extends Control

var player_count = 0

func _ready():
	$LobbyNumber.text = GameData.lobby_code

	var player_names = GameData.player_data.keys()
	
	for name in player_names:
		add_player_name(name)
		player_count += 1
	
	if GameData.host:
		$StartGameButton.show()


func _process(_delta):
	if GameData.player_data.keys().size() > player_count:
		for label in $PlayerList.get_children():
			label.queue_free()
		player_count = 0
		
		var player_names = GameData.player_data.keys()
		for name in player_names:
			add_player_name(name)
			player_count += 1


func add_player_name(name):
	var name_label = Label.new()
	name_label.text = name
	name_label.add_font_override("font", load("res://assets/fonts/Valera32.tres"))
	$PlayerList.add_child(name_label)


func _on_StartGameButton_pressed():
	if player_count >= 2:
		Server.start_game()
