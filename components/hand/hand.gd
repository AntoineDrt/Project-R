extends Node2D

var weapon: Equipment

func add(item: WeaponResource):
	weapon = item.spawn()
	add_child(weapon)
	
func flip():
	if weapon:
		weapon.flip()
