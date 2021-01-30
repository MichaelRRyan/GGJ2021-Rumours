extends Node

# An auto loaded singleton class (Project > Project Settings > Autoload)
# A global file that can be accessed from anywhere and any scene within the
# 	project.

# A list of dictionaries that defines the character traits.
var neutral_traits = [
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
	{ "name": "PR manager", "desc": "Can choose another person and negate all rumors about them this round" }
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
	"Megan"
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
	"Morrison"
]
