class_name Equipment extends Node2D

@export var sprite: Texture2D

func _ready():
	$Sprite2D.texture = sprite
	rotation = 45

func _process(delta):
	if !$AnimationPlayer.is_playing():
		look_at(get_global_mouse_position())
	if Input.is_action_pressed("attack") && !Global.isUiOpened:
		$AnimationPlayer.play("attack", -1, Global.player.stats.attackSpeed)

func flip():
	$Sprite2D.flip_v = !$Sprite2D.flip_v
