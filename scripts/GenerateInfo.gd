extends TextureRect

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize() #initialize the randomizer
	generateInfo()

	#onclick for testing purposes
func _on_Button_pressed():
	generateInfo()
	
	#generates info for specific player
func generateInfo():
	pass
