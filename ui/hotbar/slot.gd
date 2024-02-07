extends Control

signal equipItem(item: EquipmentResource)

@export var item: ItemResource

func update():
	%Item.texture = item.sprite

func clear() -> void:
	%Item.texture = null
	item = null
	Global.tooltip.visible = false
	
func _on_mouse_entered():
	if !item:
		return
	
	Global.tooltip.update(item, global_position)
	Global.tooltip.visible = true

func _on_mouse_exited():
	if !item:
		return
	
	Global.tooltip.visible = false

func _on_gui_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == 1:
			if item is EquipmentResource:
				Events.emit_signal("equipItem", item)
				clear()
