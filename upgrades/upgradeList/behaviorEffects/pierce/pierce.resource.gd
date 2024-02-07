class_name Pierce extends BehaviorEffectResource

func applyEffect(bullet: Projectile) -> void:
	bullet.data.numberOfImpacts += 1
