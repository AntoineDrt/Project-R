class_name PerkScreen extends Panel

@onready var perks: Array[Perk] = PerkList.perks
@onready var modifiersCards = %PerkList.get_children() as Array[PerkCard]

func _on_perk_chosen():
	visible = false
	get_tree().paused = false

func _init():
	Events.connect("perk_chosen", _on_perk_chosen)
	Global.perkScreen = self

func generatePerksChoice():
	var perksPool = perks.duplicate(true)

	for modifierCard in modifiersCards:
		var randomPerk = perksPool.pick_random()
		perksPool.erase(randomPerk)
		modifierCard.updateContent(randomPerk)
