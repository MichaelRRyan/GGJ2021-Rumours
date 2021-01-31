extends Control

var day = 1


func _ready():
	GameData.game_scene = self


func _process(_delta):
	if $ReadyUpPanel/ReadyUpTimerLabel.visible:
		var time = str(int($ReadyUpPanel/ReadyUpTimer.time_left))
		var text = "Cannot toggle for " + time + " seconds"
		$ReadyUpPanel/ReadyUpTimerLabel.text = text


func _on_ReadyUpBox_toggled(button_pressed):
	$ReadyUpPanel/ReadyUpBox.disabled = true
	$ReadyUpPanel/ReadyUpTimer.start()
	$ReadyUpPanel/ReadyUpTimerLabel.show()
	
	if button_pressed:
		Server.player_ready()
	else:
		Server.player_not_ready()


func _on_ReadyUpTimer_timeout():
	$ReadyUpPanel/ReadyUpBox.disabled = false
	$ReadyUpPanel/ReadyUpTimerLabel.hide()


func start_vote():
	day += 1
	$DayPanel/Label.text = "Day " + str(day)
	$ReadyUpPanel/ReadyUpBox.pressed = false
	$ReadyUpPanel/ReadyUpBox.disabled = true
	$ReadyUpPanel/ReadyUpTimer.start()
	$ReadyUpPanel/ReadyUpTimerLabel.show()
