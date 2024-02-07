class_name ExperienceBar extends ProgressBar

@onready var PlayerLevel = $PlayerLevel

func _ready():
	value = 0
	max_value = ExperienceUtils.baseXp

func addExperience(number: int):
	value += number
	
	if value == max_value:
		get_tree().paused = true
		
		value = 0
		max_value = ExperienceUtils.computeXpRequired(Global.player.level)
		PlayerLevel.text = "Lv. {level}".format({"level": str(Global.player.level)})
		
		Global.player.level += 1
		
		Global.perkScreen.generatePerksChoice()
		Global.perkScreen.visible = true
		Global.perkScreen.focus_mode = Control.FOCUS_ALL
		
