class_name Hitbox extends Area2D

func computeHit() -> Hit:
	# `owner` is the creature
	var hit = Hit.new(owner.stats.damage, Hit.Kind.Regular)
	var criticalChance = owner.stats.criticalChance
	
	if criticalChance && Rng.isProc(ceili(criticalChance)):
		hit.damage *= 2
		hit.kind = Hit.Kind.Critical

	return hit
