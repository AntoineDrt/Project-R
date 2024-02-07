extends Sprite2D

func _process(delta):
	var mouseDirection = Vector2.ZERO.direction_to(get_local_mouse_position())
	
	if mouseDirection.x < 0 && flip_h == false:
		flip_h = true
		$LeftHand.position.x = -6
		$LeftHand.flip()
	elif mouseDirection.x > 0 && flip_h == true:
		flip_h = false
		$LeftHand.position.x = 6
		$LeftHand.flip()
		
