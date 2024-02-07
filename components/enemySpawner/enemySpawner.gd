extends Node2D

@export var enemy_scene: PackedScene

func _ready():
	$AnimationPlayer.play("portal_spin")

func _on_spawn_timer_timeout():
	var enemy = enemy_scene.instantiate()
	$spawnedEnemies.add_child(enemy)
	
