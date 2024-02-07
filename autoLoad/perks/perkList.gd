extends Node
	
func multiplyStat(statName: String, amount: float):
	Global.player[statName] *= amount
	Events.emit_signal("perk_chosen")

	match statName:
		"movementSpeed":
			Global.camera.position_smoothing_speed *= amount

var perks: Array[Perk] = [
	Perk.new(
		"Movement Speed",
		[
			Perk.Modifier.new(
				"movementSpeed",
				1.5,
				"+50% movement speed", 
				multiplyStat
			)
		]
	),
	Perk.new(
		"Attack Speed",
		[
			Perk.Modifier.new(
				"attackSpeed",
				1.5,
				"+50% attack speed", 
				multiplyStat
			)
		]
	),
	Perk.new(
		"Attack Damage",
		[
			Perk.Modifier.new(
				"damage",
				1.5,
				"+50% attack damage", 
				multiplyStat
			)
		]
	),
	Perk.new(
		"Health",
		[
			Perk.Modifier.new(
				"maxHp",
				1.5,
				"+50% maximum health", 
				multiplyStat
			),
			Perk.Modifier.new(
				"currentHp",
				1.5,
				"+50% current health", 
				multiplyStat
			)
		]
	),
	Perk.new(
		"Critical chance",
		[
			Perk.Modifier.new(
				"criticalChance",
				1.5,
				"+50% critical chance", 
				multiplyStat
			)
		]
	)
]
