class_name CreatureStats extends StatsResource

@export var level: int				= 1
@export var maxHp: float			= 100
@export var currentHp: float		= 100

var canMove := true

func take_hit(hit: Hit):
	currentHp -= hit.damage
