class_name HurtBox extends Area2D

signal hitTaken(hit: Hit)

func _ready():
	connect("area_entered", _on_area_entered)
	
func _on_area_entered(hitbox) -> void:
	emit_signal("hitTaken", hitbox.hit)
