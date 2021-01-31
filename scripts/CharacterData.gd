extends Node

# An auto loaded singleton class (Project > Project Settings > Autoload)
# A global file that can be accessed from anywhere and any scene within the
# 	project.

# A list of dictionaries that defines the character traits.
var traits = [
	# Innocent traits
	{ "name": "Investigator", "desc": "Each day can tell if one piece of information is fake or true." },
	{ "name": "Priest", "desc": "Cannot tell a lie or tell people they are a priest (Second term takes priority)" },
	
	# Criminal traits
	{ "name": "Misinformer", "desc": "Can spread a piece of misinformation to any 1 person." },
	{ "name": "Forger", "desc": "Can spread rumors pretending to be someone else" },	
	
	# Neutral traits	
	{ "name": "Reporter", "desc": "More power over rumors" },
	{ "name": "Politician", "desc": "Can silence someones rumors" },
	{ "name": "Bartender", "desc": "Can pass a rumor they recieve straight onto others as if it's from that person" },
	{ "name": "Fan", "desc": "Wants to be found guilty" },
	{ "name": "Uninformed", "desc": "Unknowingly receives false information" },
	{ "name": "Drunk", "desc": "Their rumors are made to look like gibberish but still contain some keywords" },
	{ "name": "Rumormonger", "desc": "Can take 1 rumor they heard and make it appear as a fact" },
	{ "name": "Corrupt", "desc": "Has someone they want convicted" },
	{ "name": "Boss", "desc": "Can pull someone out of discussion each day" },
	{ "name": "Partner", "desc": "Must also protect their assigned partner (not the same role as them)" },
	{ "name": "Nosey", "desc": "Has to recieve at least 1 piece of info a day or will be inactive for one day" },
	{ "name": "Mortician", "desc": "Receives more info then others" },
	{ "name": "Clout Chaser", "desc": "Must receive the most rumors to win" },
	{ "name": "Artist", "desc": "Rumors are presented as drawings" },
	{ "name": "Child", "desc": "Hears all rumors sent to a specific person but cant send rumors" },
	{ "name": "Butler", "desc": "Rumors from the butler come always up as fake when investigated" },
	{ "name": "PR Manager", "desc": "Can choose another person and negate all rumors about them this round" }
]

var rp_traits = [
	{ "name": "Drunk", "desc": "Most know you as the town drunk" },
	{ "name": "Aggressive", "desc": "You always treat others with hostility" },
	{ "name": "Anxious", "desc": "Are they talking about you?" },
	{ "name": "Bossy", "desc": "Lead the conversation and order people around" },	
	{ "name": "Clumsy", "desc": "Make lots of mistakes" },
	{ "name": "Cowardly", "desc": "Scared to give information" },
	{ "name": "Dangerous", "desc": "You sound pretty scary" },
	{ "name": "Deceitful", "desc": "Compulsively tell lies" },
	{ "name": "Devious", "desc": "Try to scheme and look suspicious" },
	{ "name": "Jester", "desc": "Always place yourself at the scene of the crime" },
	{ "name": "Discouraging", "desc": "Always try to put everyone down" },
	{ "name": "Encouraging", "desc": "Try to compliment everyone" },
	{ "name": "Flirt", "desc": "Act heavily flirtatious" },
	{ "name": "Disruptive", "desc": "Talk over people as much as possible" },
	{ "name": "Lazy", "desc": "Only give out information if you feel like it" },
	{ "name": "Jealous", "desc": "Try to 1up everyone with false info" },
	{ "name": "Moan", "desc": "Complain as much as possible" },
	{ "name": "Grim", "desc": "Talk as morbidly dark as possible" },
	{ "name": "Shy", "desc": "Don't talk a lot, but if you do, do it quietly" },
	{ "name": "Liar", "desc": "Tell lies for no reason" },
	{ "name": "Weak", "desc": "Make empty threats" }
]

var features_head = [
	"res://assets/images/newPlayerIcons/Hat_0.png",
	"res://assets/images/newPlayerIcons/Hat_1.png",
	"res://assets/images/newPlayerIcons/Hat_2.png",
	"res://assets/images/newPlayerIcons/Hat_3.png",
	"res://assets/images/newPlayerIcons/Hat_4.png",
	"res://assets/images/newPlayerIcons/Hat_5.png"
]

var features_face = [
	"res://assets/images/newPlayerIcons/Face_0.png",
	"res://assets/images/newPlayerIcons/Face_1.png",
	"res://assets/images/newPlayerIcons/Face_2.png",
	"res://assets/images/newPlayerIcons/Face_3.png",
	"res://assets/images/newPlayerIcons/Face_4.png",
	"res://assets/images/newPlayerIcons/Face_5.png"
]

var features_body = [
	"res://assets/images/newPlayerIcons/Body_0.png",
	"res://assets/images/newPlayerIcons/Body_1.png",
	"res://assets/images/newPlayerIcons/Body_2.png",
	"res://assets/images/newPlayerIcons/Body_3.png",
	"res://assets/images/newPlayerIcons/Body_4.png",
	"res://assets/images/newPlayerIcons/Body_5.png",
	"res://assets/images/newPlayerIcons/Body_6.png",
	"res://assets/images/newPlayerIcons/Body_7.png",
	"res://assets/images/newPlayerIcons/Body_8.png",
	"res://assets/images/newPlayerIcons/Body_9.png",
	"res://assets/images/newPlayerIcons/Body_10.png"
]

var first_names = [
	"Daniel",
	"Garry",
	"Ken",
	"Michael",
	"Tom",
	"Ryan",
	"Aaron",
	"Aria",
	"Katie",
	"Megan",
	"Philip",
	"Henry",
	"Hank",
	"Rob",
	"Lee",
	"Ted",
	"Aidan",
	"Fraser",
	"Dexter",
	"Nick",
	"Steven",
	"Mica",
	"Zach",
	"Conor",
	"Eoin",
	"Layton",
	"Gerald",
	"Lewis",
	"Lez",
	"Lola",
	"Samantha",
	"Fleur",
	"Kaitlyn",
	"Sophie",
	"Maria",
	"Mimi",
	"Barbara",
	"Isie",
	"Gloria",
	"Niamh",
	"Tess",
	"Naomi",
	"Peter",
	"Dylan",
	"Willow",
	"Bernadette"
	
]

var last_names = [
	"Myers",
	"Farrell",
	"Dickson",
	"Wade",
	"Daniels",
	"Wyatt",
	"McCann",
	"Petersen",
	"Cameron",
	"Morrison",
	"Carroll",
	"Ferguson",
	"Brando",
	"Burton",
	"Park",
	"Williams",
	"Kirkland",
	"Carey",
	"O'Connor",
	"Saunders",
	"Holt",
	"Spencer",
	"Johnson",
	"Miller",
	"Hamilton",
	"Trump",
	"Benally",
	"Obama",
	"Calvin",
	"Kennedy",
	"Anderson",
	"Biden",
	"Cole",
	"Young",
	"Hardy",
	"Forrest",
	"Howard",
	"Joestar",
	"Baker",
	"Hutchinson",
	"Cunningham",
	"Barton",
	"Byrne",
	"Bolger",
	"Power",
	"Lowwe"
]

var playerName = ""
var playerAlignment
