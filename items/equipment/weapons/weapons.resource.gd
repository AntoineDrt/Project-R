class_name WeaponResource extends EquipmentResource

@export var scene: PackedScene

func spawn() -> Equipment:
	var equipment = scene.instantiate()
	equipment.sprite = sprite
	
	return equipment
