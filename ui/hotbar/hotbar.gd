extends Control

@export var items: Array[EquipmentResource] = []

func add(item: EquipmentResource):
	if items.size() <= 6:
		return

	items.push_back(item)
	
	var itemIndex = items.find(item)
	%Slots.get_children()[itemIndex].update()
	
