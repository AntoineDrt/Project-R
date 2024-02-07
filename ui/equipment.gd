class_name EquipmentUI extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("equipItem", equipItem)
	
	var equipments = Global.player.inventory.filter(
		func (i): return i is EquipmentResource && i.isEquiped
	)
	
	for equipment in equipments as Array[EquipmentResource]:
		equipItem(equipment)

func equipItem(item: EquipmentResource) -> void:
	match item.type:
		EquipmentResource.EquipmentType.HELMET:
			%Head.item = item
		EquipmentResource.EquipmentType.WEAPON:
			%Weapon.item = item
		EquipmentResource.EquipmentType.BOOTS:
			%Boots.item = item
		EquipmentResource.EquipmentType.RING:
			%Ring.item = item
		EquipmentResource.EquipmentType.CHEST:
			%Chest.item = item

