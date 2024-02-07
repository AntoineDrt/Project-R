extends Node
class_name Perk

var title: String
var modifiers: Array[Modifier]

func _init(_title: String, _modifiers: Array[Modifier]):
	title = _title
	modifiers = _modifiers
	
class Modifier:
	# Name of the property associated with the stat
	var statName: String
	# Amount of the modifier applied to the stat
	var amount: float
	# Short text describing what the modifier does
	var description: String
	# Function applying the modifier in the game
	var modifier: Callable
	
	func _init(
		_statName: String,
		_amount: float,
		_description: String, 
		_modifier: Callable
	):
		statName = _statName
		amount = _amount
		description = _description
		modifier = _modifier
