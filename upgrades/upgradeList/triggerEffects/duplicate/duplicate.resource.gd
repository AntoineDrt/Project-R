class_name DuplicateTriggerEffect extends TriggerEffectResource

func triggerEffect(entity: Projectile) -> void:
	if entity.isDuplicate:
		return
		
	var duplicatedEntity = entity.duplicate()
	duplicatedEntity.isDuplicate = true
	await Global.get_tree().create_timer(0.1 / Global.player.stats.attackSpeed).timeout
	duplicatedEntity.global_position = Global.player.global_position
	Global.game.call_deferred("add_child", duplicatedEntity)
