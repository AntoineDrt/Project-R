class_name Staff extends Equipment

@export var projectileResource: ProjectileResource
@export var shootType: Resource

func attack():
	disableMovement()
	fireProjectile()

func fireProjectile():
	var projectile = projectileResource.scene.instantiate()
	
	projectile.data = projectileResource.duplicate()
	projectile.global_position = global_position
	
	Global.game.add_child(projectile)

func enableMovement() -> void:
	Global.player.stats.canMove = true
	
func disableMovement() -> void:
	Global.player.stats.canMove = false
