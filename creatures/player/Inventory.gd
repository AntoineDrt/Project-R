extends Control

func _ready():
	visible = false
	initInventory()

func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		visible = !visible
		Global.isUiOpened = visible
		
		var slots = %Slots.get_child(0)
		slots.grab_focus()
		
func initInventory() -> void:
	var inventoryItems = Global.player.inventory.filter(
		func (i): return !i.isEquiped
	)
	var slots = %Slots.get_children()
	var i = 0
	
	for item in inventoryItems:
		slots[i].item = item
		slots[i].update()
		i += 1
