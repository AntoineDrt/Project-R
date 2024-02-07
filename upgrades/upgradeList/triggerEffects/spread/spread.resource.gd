class_name SpreadTriggerEffect extends TriggerEffectResource

func triggerEffect(bullet: Projectile) -> void:
	var duplicatedBullet = bullet.duplicate()
	duplicatedBullet.data.velocity += Vector2(1, 0)
	Global.game.call_deferred("add_child", duplicatedBullet)
