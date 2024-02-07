extends Node2D

var cachedMovementSpeed: float

func immobilize():
	cachedMovementSpeed = owner.stats.movementSpeed
	owner.stats.movementSpeed = 0
	
func resetMovementSpeed():
	owner.stats.movementSpeed = cachedMovementSpeed


func _on_attack_range_area_entered(area):
	$AnimationPlayer.play("attack")
