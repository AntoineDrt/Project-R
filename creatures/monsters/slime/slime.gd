extends CharacterBody2D

@onready var animation: AnimationTree = $AnimationTree

@export var stats: CreatureStats

func _ready():
	$MoveTowards.target = Global.player

func _on_animation_finished(anim_name):
	match anim_name:
		"death":
			queue_free()
		"get_hit":
			animation.set("parameters/conditions/get_hit", false)
			animation.set("parameters/conditions/is_moving", true)

func _on_death():
	stats.movementSpeed = 0
	animation.set("parameters/conditions/is_dead", true)
	$LootDrop.drop_loot()

func _on_hit_taken(hit: Hit):
	animation.set("parameters/conditions/is_moving", false)
	
	match hit.kind:
		Hit.Kind.Critical:
			animation.set("parameters/conditions/get_critical_hit", true)
		Hit.Kind.Regular:
			animation.set("parameters/conditions/get_hit", true)
