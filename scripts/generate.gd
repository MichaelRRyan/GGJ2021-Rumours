#author: Conor McDonagh Rollo
#date: 30/01/21
#description: Generates a random character for the player
#bugs: features still overlap

extends TextureRect

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize() #initialize the randomizer
	generateCharacter()

	#onclick for testing purposes
func _on_Button_pressed():
	generateCharacter()
	
	#fully generates a character for said player
func generateCharacter():
	var firstName = rng.randi_range(1, 10) #generate a name
	var lastName = rng.randi_range(1, 10)
	var feat1 = rng.randi_range(1, 5) #features for overlapping 
	var feat2 = rng.randi_range(1, 5)
	var alignment = rng.randi_range(1, 2) #1 is innocent and 2 is criminal, this should be divided by playercount
	var roleTrait #trait determined whether a player is innocent or not
	var roleTraitDesc #description for above role
	var neutralTrait = rng.randi_range(1, 17) #traits that any character can get
	var neutralTraitDesc #description for above role
	
	#make sure features dont overlap (currently broken)
	if feat1 == feat2:
		if feat1 == 5:
			feat1 -= 1
		elif feat1 == 1:
			feat1 += 1
		else:
			feat1 += 1
	elif feat1 == 3 and feat2 == 4:
			feat1 -= 1
	elif feat1 == 4 and feat2 == 3:
			feat1 += 1
		#generate the first name
	if firstName == 1:
		firstName = "Daniel"
	elif firstName == 2:
		firstName = "Garry"
	elif firstName == 3:
		firstName = "Ken"
	elif firstName == 4:
		firstName = "Michael"
	elif firstName == 5:
		firstName = "Tom"
	elif firstName == 6:
		firstName = "Ryan"
	elif firstName == 7:
		firstName = "Aaron"
	elif firstName == 8:
		firstName = "Aria"
	elif firstName == 9:
		firstName = "Katie"
	else:
		firstName = "Megan"
		#generate the last name
	if lastName == 1:
		lastName = "Myers"
	elif lastName == 2:
		lastName = "Farrell"
	elif lastName == 3:
		lastName = "Dickson"
	elif lastName == 4:
		lastName = "Wade"
	elif lastName == 5:
		lastName = "Daniels"
	elif lastName == 6:
		lastName = "Wyatt"
	elif lastName == 7:
		lastName = "McCann"
	elif lastName == 8:
		lastName = "Petersen"
	elif lastName == 9:
		lastName = "Cameron"
	else:
		lastName = "Morrison"
		#set the Name and Last name of the person
	get_node("TextureRect/Name").text = firstName + " " + lastName
		#decide feature 1
	if feat1 == 1:
		feat1 = load("res://assets/images/playericons/backpack.png")
	elif feat1 == 2:
		feat1 = load("res://assets/images/playericons/cowboy.png")
	elif feat1 == 3:
		feat1 = load("res://assets/images/playericons/roundglasses.png")
	elif feat1 == 4:
		feat1 = load("res://assets/images/playericons/squareglasses.png")
	else:
		feat1 = load("res://assets/images/playericons/smoking.png")
		#decide feature 2
	if feat2 == 1:
		feat2 = load("res://assets/images/playericons/backpack.png")
	elif feat2 == 2:
		feat2 = load("res://assets/images/playericons/cowboy.png")
	elif feat2 == 3:
		feat2 = load("res://assets/images/playericons/roundglasses.png")
	elif feat2 == 4:
		feat2 = load("res://assets/images/playericons/squareglasses.png")
	else:
		feat2 = load("res://assets/images/playericons/smoking.png")
		
		#set the feature textures
	get_node("TextureRect/feature1").texture = feat1
	get_node("TextureRect/feature2").texture = feat2
	
	#decide the alignment and the roleTrait
	if alignment == 1:
		roleTrait = rng.randi_range(1, 2)
		if roleTrait == 1:
			roleTrait = "Investigator"
			roleTraitDesc = "Each day can tell if one piece of information is fake or true."
		elif roleTrait == 2:
			roleTrait = "Priest"
			roleTraitDesc = "Cannot tell a lie or tell people they are a priest (Second term takes priority)"
	else:
		roleTrait = rng.randi_range(1, 2)
		if roleTrait == 1:
			roleTrait = "Misinformer"
			roleTraitDesc = "Can spread a piece of misinformation to any 1 person."
		else:
			roleTrait = "Forger"
			roleTraitDesc = "Can spread rumors pretending to be someone else"
		#set the text to the role
	get_node("VBoxContainer/Trait1").text = roleTrait + ": " + roleTraitDesc
	
	#decide the neutral traits and their descriptions
	if neutralTrait == 1:
		neutralTrait = "Reporter"
		neutralTraitDesc = "More power over rumors"
	elif neutralTrait == 2:
		neutralTrait = "Politician"
		neutralTraitDesc = "Can silence someones rumors"
	elif neutralTrait == 3:
		neutralTrait = "Bartender"
		neutralTraitDesc = "Can pass a rumor they recieve straight onto others as if it's from that person"
	elif neutralTrait == 4:
		neutralTrait = "Fan"
		neutralTraitDesc = "Wants to be found guilty"
	elif neutralTrait == 5:
		neutralTrait = "Uninformed"
		neutralTraitDesc = "Unknowingly receives false information"
	elif neutralTrait == 6:
		neutralTrait = "Drunk"
		neutralTraitDesc = "Their rumors are made to look like gibberish but still contain some keywords"
	elif neutralTrait == 7:
		neutralTrait = "Rumormonger"
		neutralTraitDesc = "Can take 1 rumor they heard and make it appear as a fact"
	elif neutralTrait == 8:
		neutralTrait = "Corrupt"
		neutralTraitDesc = "Has someone they want convicted"
	elif neutralTrait == 9:
		neutralTrait = "Boss"
		neutralTraitDesc = "Can pull someone out of discussion each day"
	elif neutralTrait == 10:
		neutralTrait = "Partner"
		neutralTraitDesc = "Must also protect their assigned partner(not the same role as them)"
	elif neutralTrait == 11:
		neutralTrait = "Nosey"
		neutralTraitDesc = "Has to recieve at least 1 piece of info a day or will be inactive for one day"
	elif neutralTrait == 12:
		neutralTrait = "Mortician"
		neutralTraitDesc = "Receives more info then others"
	elif neutralTrait == 13:
		neutralTrait = "Clout Chaser"
		neutralTraitDesc = "Must receive the most rumors to win"
	elif neutralTrait == 14:
		neutralTrait = "Artist"
		neutralTraitDesc = "Rumors are presented as drawings"
	elif neutralTrait == 15:
		neutralTrait = "Child"
		neutralTraitDesc = "Hears all rumors sent to a specific person but cant send rumors"
	elif neutralTrait == 16:
		neutralTrait = "Butler"
		neutralTraitDesc = "Rumors from the butler come always up as fake when investigated"
	else: 
		neutralTrait = "PR manager"
		neutralTraitDesc = "Can choose another person and negate all rumors about them this round"
		
		#set the neutral traits and their descriptions
	get_node("VBoxContainer/Trait2").text = neutralTrait + ": " + neutralTraitDesc
