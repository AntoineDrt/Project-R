extends Node2D

@export var resource: EquipmentResource

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = resource.sprite
	$Label.text = resource.name
	#$AnimationPlayer.play("floating")

func _on_interaction_area_player_accepted():
	Global.player.inventory.push_back(resource)
	queue_free()
