extends Node2D

func _ready():
	$Sprite2D.visible = false

func _on_detection_area_entered(area):
	$AnimationTree["parameters/conditions/disappear"] = false
	$AnimationTree["parameters/conditions/spawn"] = true

func _on_detection_area_exited(area):
	$AnimationTree["parameters/conditions/disappear"] = true
	$AnimationTree["parameters/conditions/spawn"] = false

func _on_transition_player_accepted():
	Global.mapManager.loadMap("res://maps/dungeon.tscn", get_parent())
