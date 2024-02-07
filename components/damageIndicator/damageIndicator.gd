extends Node2D
	
var hit: Hit

func _ready() -> void:
	$Control/Label.text = str(-hit.damage)

	match hit.kind:
		Hit.Kind.Regular:
			$AnimationPlayer.play("RegularDamage")
		Hit.Kind.Critical:
			$AnimationPlayer.play("CriticalDamage")

func destroy() -> void:
	call_deferred("queue_free")
