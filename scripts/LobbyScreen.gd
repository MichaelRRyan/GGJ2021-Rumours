extends Control

func _ready():
	$LobbyNumber.text = GameData.lobby_code

	if GameData.player_names:
		for name in GameData.player_names:
			add_player_name(name)


func add_player_name(name):
	var name_label = Label.new()
	name_label.text = name
	name_label.add_font_override("font", load("res://assets/fonts/Valera32.tres"))
	$PlayerList.add_child(name_label)


func _on_TextEnterDialog_confirm_pressed():
	var player_name = $NameDialog.get_input()
	
	if player_name.length() > 0:
		Server.set_player_name(GameData.lobby_code, player_name)
		$NameDialog.hide()
		
		if GameData.player_names:
			GameData.player_names.append(player_name)
		else:
			GameData.player_names = [ player_name ]
			
		add_player_name(player_name)
	else:
		$NameDialog.display_error("You must enter a name")
