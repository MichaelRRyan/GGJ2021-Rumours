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
	
	var threshold = rng.randi_range(0,1)
	
	if threshold == 1:
		var evidence = InfoData.false_evidence[rng.randi_range(0, InfoData.false_evidence.size() -1)]
		get_node("Evidence/Evidence1").text = evidence
