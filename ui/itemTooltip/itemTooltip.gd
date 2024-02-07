class_name ItemTooltip extends PanelContainer

func _ready() -> void:
	Global.tooltip = self
	visible = false

func update(item: ItemResource, global_pos: Vector2) -> void:
	clear()
	
	%Name.text = item.name
	%Sprite.texture = item.sprite
	
	if item.description:
		%Description.text = item.description
		%Description.visible = true
	
	if item is EquipmentResource:
		%Stats.visible = true
		var stats = item.stats as StatsResource
	
		if stats.damage:
			addStatText("damage", stats.damage)
			
	
	size.y = $Panel.size.y
	global_position = global_pos
	pivot_offset = -size / 2.3

func addStatText(name: String, modifier: float) -> void:
	var symbol
	
	if modifier >= 0:
		symbol = "+"
	else:
		symbol = "-"
	
	var statText = RichTextLabel.new()
	statText.fit_content = true
	statText.scroll_active = false
	statText.autowrap_mode = TextServer.AUTOWRAP_OFF
	statText.text = "%s: %s%d" % [name.capitalize(), symbol, modifier]
	%Stats.add_child(statText)

func clear() -> void:
	%Description.text = ""
	%Description.visible = false
	
	for statNode in %Stats.get_children():
		statNode.queue_free()

	%Stats.visible = false
