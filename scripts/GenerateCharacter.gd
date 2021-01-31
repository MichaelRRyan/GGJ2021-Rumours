#author: Conor McDonagh Rollo
#date: 30/01/21
#description: Generates a random character for the player
#bugs: none

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
	var feat1 = rng.randi_range(0, 6) #features hat
	var feat2 = rng.randi_range(0, 6) #features face
	var feat3 = rng.randi_range(0, 10) #features body
	var alignment = rng.randi_range(1, 2) #1 is innocent and 2 is criminal, this should be divided by playercount
	var roleTrait #trait determined whether a player is innocent or not
	var roleTraitDesc #description for above role
	
	var firstName = CharacterData.first_names[rng.randi_range(0, CharacterData.first_names.size() - 1)]
	var lastName = CharacterData.last_names[rng.randi_range(0, CharacterData.last_names.size() - 1)]
		
	#set the Name and Last name of the person
	get_node("TextureRect/Name").text = firstName + " " + lastName
		#decide feature 1
	if feat1 == 0:
		feat1 = load("res://assets/images/newPlayerIcons/Hat_0.png")
	elif feat1 == 1:
		feat1 = load("res://assets/images/newPlayerIcons/Hat_1.png")
	elif feat1 == 2:
		feat1 = load("res://assets/images/newPlayerIcons/Hat_2.png")
	elif feat1 == 3:
		feat1 = load("res://assets/images/newPlayerIcons/Hat_3.png")
	elif feat1 == 4:
		feat1 = load("res://assets/images/newPlayerIcons/Hat_4.png")
	elif feat1 == 5:
		feat1 = load("res://assets/images/newPlayerIcons/Hat_5.png")
	else:
		feat1 = null
		#decide feature 2
	if feat2 == 0:
		feat2 = load("res://assets/images/newPlayerIcons/Face_0.png")
	elif feat2 == 1:
		feat2 = load("res://assets/images/newPlayerIcons/Face_1.png")
	elif feat2 == 2:
		feat2 = load("res://assets/images/newPlayerIcons/Face_2.png")
	elif feat2 == 3:
		feat2 = load("res://assets/images/newPlayerIcons/Face_3.png")
	elif feat2 == 4:
		feat2 = load("res://assets/images/newPlayerIcons/Face_4.png")
	elif feat2 == 5:
		feat2 = load("res://assets/images/newPlayerIcons/Face_5.png")
	else:
		feat2 = null
		
	if feat3 == 0:
		feat3 = load("res://assets/images/newPlayerIcons/Body_0.png")
	elif feat3 == 1:
		feat3 = load("res://assets/images/newPlayerIcons/Body_1.png")
	elif feat3 == 2:
		feat3 = load("res://assets/images/newPlayerIcons/Body_2.png")
	elif feat3 == 3:
		feat3 = load("res://assets/images/newPlayerIcons/Body_3.png")
	elif feat3 == 4:
		feat3 = load("res://assets/images/newPlayerIcons/Body_4.png")
	elif feat3 == 5:
		feat3 = load("res://assets/images/newPlayerIcons/Body_5.png")
	elif feat3 == 6:
		feat3 = load("res://assets/images/newPlayerIcons/Body_6.png")
	elif feat3 == 7:
		feat3 = load("res://assets/images/newPlayerIcons/Body_7.png")
	elif feat3 == 8:
		feat3 = load("res://assets/images/newPlayerIcons/Body_8.png")
	elif feat3 == 9:
		feat3 = load("res://assets/images/newPlayerIcons/Body_9.png")
	elif feat3 == 10:
		feat3 = load("res://assets/images/newPlayerIcons/Body_10.png")
				
		#set the feature textures
	get_node("TextureRect/feature1").texture = feat1
	get_node("TextureRect/feature2").texture = feat2
	get_node("TextureRect/feature3").texture = feat3
	
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
	
	# Sets the text to the role
	get_node("VBoxContainer/Trait1").text = roleTrait + ": " + roleTraitDesc
	
	# Decides the neutral traits and their descriptions.
	var num_traits = CharacterData.neutral_traits.size() - 1
	var neut_trait = CharacterData.neutral_traits[rng.randi_range(0, num_traits)]
	
	# sets the neutral traits and their descriptions.
	get_node("VBoxContainer/Trait2").text = neut_trait["name"] + ": " + neut_trait["desc"]
	
	CharacterData.playerName = firstName + " " + lastName
	CharacterData.playerAlignment = alignment
