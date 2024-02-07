extends AnimationPlayer

func _on_hurt_box_hit_taken(hit):
	stop(true)
	play("get_hit")
