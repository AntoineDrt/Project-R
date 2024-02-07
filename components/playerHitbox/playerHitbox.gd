class_name PlayerHitbox extends Area2D

var hit: Hit

func _ready():
	hit = computeHit()

func computeHit() -> Hit:
	# `owner` is the object. So `wielder` is the creature wielding the object
	var hit = Hit.new(Global.player.stats.damage, Hit.Kind.Regular)
	var criticalChance = Global.player.stats.criticalChance
	
	if criticalChance && Rng.isProc(ceili(criticalChance)):
		hit.damage *= 2
		hit.kind = Hit.Kind.Critical

	return hit
