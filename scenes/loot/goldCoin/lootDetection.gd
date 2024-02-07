class_name Loot extends Area2D

@onready var xpBar: ExperienceBar = get_node("/root/World/Player/%ui/%ExperienceBar")
@onready var goldCoin: Node2D = get_parent()

@export var movementSpeed = 200

var isBeingLooted := false

func _ready():
	$"../AnimationPlayer".play("spin")

func _process(delta):
	if isBeingLooted:
		goldCoin.position = goldCoin.position.move_toward(Global.player.position, movementSpeed * delta)
		if goldCoin.position == Global.player.position:
			xpBar.addExperience(1)
			goldCoin.queue_free()

func _on_area_entered(area):
	isBeingLooted = true
