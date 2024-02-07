extends Node2D

@export var target: Node2D
@export var animationTree: AnimationTree

@onready var pathfinder: NavigationAgent2D = $Pathfinder

func _process(delta):
	if !pathfinder.target_position:
		return
	
	animationTree.set("parameters/conditions/is_moving", true)
	
	var direction = to_local(pathfinder.get_next_path_position()).normalized()
	
	owner.velocity = direction * owner.stats.movementSpeed
	owner.move_and_slide()

func _on_refresh_path_finding_timeout():
	pathfinder.target_position = target.global_position
