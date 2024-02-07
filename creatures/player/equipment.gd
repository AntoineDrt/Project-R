class_name PlayerEquipment extends Resource

@export var weapon: EquipmentResource
@export var helmet: EquipmentResource
@export var chest: EquipmentResource
@export var boots: EquipmentResource
@export var ring: EquipmentResource
@export var gloves: EquipmentResource

func _ready() -> void:
	Events.connect("equipItem", equip)

func equip(item: EquipmentResource):
	item.applyStats()
