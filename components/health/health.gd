class_name HealthComponent extends Node2D

signal isDead

@onready var damageIndicator = preload("res://components/damageIndicator/damageIndicator.tscn")

func _ready():
	$hp.max_value = owner.stats.maxHp
	$hp.value = owner.stats.currentHp

func _on_hit_taken(hit: Hit):
	owner.stats.currentHp -= hit.damage
	$hp.value = owner.stats.currentHp

	var damageIndicatorInstance = damageIndicator.instantiate()
	damageIndicatorInstance.hit = hit
	
	owner.call_deferred("add_child", damageIndicatorInstance)

	if $hp.value <= 0:
		emit_signal("isDead")
