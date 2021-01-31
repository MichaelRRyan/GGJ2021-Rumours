extends Control


func _ready():
	pass # Replace with function body.


func _on_JoinGameButton_pressed():
	var player_name = $NameDialog/NameInput.text
	
	if player_name.length() > 0:
		$NameDialog/NameInput.editable = false
		$JoinLobbyDialog.show()
	else:
		$NameDialog/ErrorText.show()


func _on_CreateGameButton_pressed():
	var player_name = $NameDialog/NameInput.text
	
	if player_name.length() > 0:
		Server.create_lobby(player_name)
	else:
		$NameDialog/ErrorText.show()


func _on_JoinLobbyDialog_confirm_pressed():
	var lobby_code = $JoinLobbyDialog.get_input()
	var player_name = $NameDialog/NameInput.text
		
	if lobby_code.length() == 4:
		Server.join_lobby(lobby_code, player_name, get_instance_id())
		$NameDialog/NameInput.editable = true
	else:
		$JoinLobbyDialog.display_error("Please enter a 4 digit number")


func _on_JoinLobbyDialog_back_pressed():
	$NameDialog/NameInput.editable = true


func display_error(error):
	$AlertDialog.set_text("Error", error)
	$AlertDialog.show()
