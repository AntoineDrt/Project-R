extends Node

@export var animationTree: AnimationTree
@export var walkingTrail: CPUParticles2D
@export var appearance: Sprite2D

func _process(delta):
	if !owner.stats.canMove:
		return
		
	var direction: Vector2 = Input.get_vector(
		"ui_left", 
		"ui_right", 
		"ui_up", 
		"ui_down"
		).normalized()
	
	owner.velocity.x = move_toward(
		owner.velocity.x, 
		owner.stats.movementSpeed * direction.x, 
		owner.stats.acceleration)
	owner.velocity.y = move_toward(
		owner.velocity.y, 
		owner.stats.movementSpeed * direction.y, 
		owner.stats.acceleration)
		
	if direction == Vector2.ZERO:
		animationTree["parameters/conditions/is_idle"] = true
		animationTree["parameters/conditions/is_moving"] = false
		animationTree["parameters/conditions/take_hit"] = false
		walkingTrail.emitting = false
	else:
		animationTree["parameters/conditions/is_idle"] = false
		animationTree["parameters/conditions/is_moving"] = true
		animationTree["parameters/conditions/take_hit"] = false
		walkingTrail.emitting = true
		walkingTrail.rotation = direction.angle()

	owner.move_and_slide()
