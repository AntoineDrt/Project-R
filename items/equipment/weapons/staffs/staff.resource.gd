class_name StaffResource extends WeaponResource

@export var projectile: ProjectileResource
@export var projectilesNumber := 1

func equip() -> Equipment:
	var equipment = scene.instantiate()
	equipment.sprite = sprite
	equipment.projectileResource = projectile
	applyStats()
	
	return equipment
