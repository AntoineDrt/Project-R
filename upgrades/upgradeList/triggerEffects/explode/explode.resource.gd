class_name ExplodeTriggerEffect extends TriggerEffectResource

func triggerEffect(projectile: Projectile) -> void:
	var explosionScene = preload("res://upgrades/upgradeList/triggerEffects/explode/explosion.tscn")
	var explosion = explosionScene.instantiate() as PlayerHitbox
	
	explosion.global_position = projectile.global_position
	
	await projectile.get_tree().create_timer(0.1).timeout
	
	Global.game.call_deferred("add_child", explosion)
