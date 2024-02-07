extends ProgressBar

func _ready():
	Global.connect("playerSet", setHealth)

func setHealth(player: Player):
	max_value = Global.player.stats.maxHp
	value = Global.player.stats.currentHp

func _on_hurt_box_hit_taken(hit: Hit):
	Global.player.stats.currentHp -= hit.damage
	value = Global.player.stats.currentHp

	if value <= 0:
		emit_signal("isDead")
