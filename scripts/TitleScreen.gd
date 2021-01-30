extends Control


func _ready():
	pass # Replace with function body.


func _on_JoinGameButton_pressed():
	$JoinLobbyDialog.show()


func _on_CreateGameButton_pressed():
	Server.create_lobby()


func _on_JoinLobbyDialog_confirm_pressed():
	var lobby_code = $JoinLobbyDialog.get_input()
	
	if lobby_code.length() == 4:
		Server.join_lobby(lobby_code)
	else:
		$JoinLobbyDialog.display_error("Please enter a 4 digit number")
