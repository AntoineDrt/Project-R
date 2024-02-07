class_name EquipmentResource extends ItemResource

enum EquipmentType { 
	WEAPON, 
	HELMET, 
	CHEST,
	GLOVES,
	BOOTS,
	RING
}

@export var stats: StatsResource
@export var type: EquipmentType

@export var isEquiped := false

var onClick = func ():
	Events.emit_signal("equipItem", self)

func applyStats():
	if !stats:
		return
		
	Global.player.stats.damage += stats.damage
	Global.player.stats.armor += stats.armor
	Global.player.stats.magicResistance += stats.magicResistance
	Global.player.stats.attackSpeed += stats.attackSpeed
	Global.player.stats.movementSpeed += stats.movementSpeed
	Global.player.stats.criticalChance += stats.criticalChance
	Global.player.stats.cooldownReduction += stats.cooldownReduction
	Global.player.stats.acceleration += stats.acceleration

func removeStats():
	if !stats:
		return
		
	Global.player.stats.damage -= stats.damage
	Global.player.stats.armor -= stats.armor
	Global.player.stats.magicResistance -= stats.magicResistance
	Global.player.stats.attackSpeed -= stats.attackSpeed
	Global.player.stats.movementSpeed -= stats.movementSpeed
	Global.player.stats.criticalChance -= stats.criticalChance
	Global.player.stats.cooldownReduction -= stats.cooldownReduction
	Global.player.stats.acceleration -= stats.acceleration
