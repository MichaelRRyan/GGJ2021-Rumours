#author: Conor McDonagh Rollo
#date: 30/01/21
#description: Generates a random character for the player
#bugs: none

extends TextureRect

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize() #initialize the randomizer
	generateCharacter()

# Onclick for testing purposes
func _on_Button_pressed():
	generateCharacter()
	
	
# Fully generates a character for said player
func generateCharacter():
	var feat1 = rng.randi_range(0, 6) #features hat
	var feat2 = rng.randi_range(0, 6) #features face
	var feat3 = rng.randi_range(0, 10) #features body
	var alignment = rng.randi_range(0, 1) #0 is innocent and 1 is criminal, this should be divided by playercount
	var trait1 = rng.randi_range(0, 1) + (alignment * 2)
	var num_traits = CharacterData.traits.size() - 1
	var trait2 = rng.randi_range(4, num_traits)
	var trait3 = rng.randi_range(0, CharacterData.rp_traits.size() - 1)
	
	var firstName = CharacterData.first_names[rng.randi_range(0, CharacterData.first_names.size() - 1)]
	var lastName = CharacterData.last_names[rng.randi_range(0, CharacterData.last_names.size() - 1)]

	create_character(firstName + " " + lastName,
					 rng.randi_range(0, 1),
					 feat1, feat2, feat3,
					 trait1, trait2, trait3)


func create_character(character_name, alignment, feat1, feat2, feat3, trait1, trait2, trait3):
	
	CharacterData.playerName = character_name
	CharacterData.playerAlignment = alignment
	
	get_node("TextureRect/Name").text = character_name

	# Decide feature 1
	if feat1 < 6:
		feat1 = load(CharacterData.features_head[feat1])
	else:
		feat1 = null
		
	# Decide feature 2
	if feat2 < 6:
		feat2 = load(CharacterData.features_face[feat2])
	else:
		feat2 = null
	
	# Decide feature 3
	feat3 = load(CharacterData.features_body[feat3])
				
	# Set the feature textures
	get_node("TextureRect/feature1").texture = feat1
	get_node("TextureRect/feature2").texture = feat2
	get_node("TextureRect/feature3").texture = feat3
	
	# Decides the alignment and the roleTrait
	var role_trait = CharacterData.traits[trait1]
	
	get_node("VBoxContainer/Trait1").text = role_trait["name"] + ": " + role_trait["desc"]
	
	# Decides the neutral traits and their descriptions.
	var neut_trait = CharacterData.traits[trait2]
	
	get_node("VBoxContainer/Trait2").text = neut_trait["name"] + ": " + neut_trait["desc"]
	
	# Decides the rp traits and their descriptions.
	var rp_trait = CharacterData.rp_traits[trait3]
	
	get_node("VBoxContainer/Trait3").text = rp_trait["name"] + ": " + rp_trait["desc"]
