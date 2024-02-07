class_name Player extends CharacterBody2D

@export var stats: CreatureStats
@export var inventory: Array[ItemResource]
@export var equipment: PlayerEquipment
	
func _ready():
	Events.connect("equipItem", equipItem)
	Global.setPlayer(self)
	Global.camera = %Camera

func _on_hurt_box_hit_taken(hit):
	$AnimationTree["parameters/conditions/take_hit"] = true
	Global.frameFreeze(0.1, 0.5)

func equipItem(item: EquipmentResource) -> void:
	match item.type:
		EquipmentResource.EquipmentType.WEAPON:
			%LeftHand.add(item)
