class_name Projectile extends PlayerHitbox

@export var data: 	ProjectileResource

var isDuplicate = false

var d := 0.0

func _ready():
	hit = computeHit()
	
	$Bullet.texture = data.sprite
	$Timer.wait_time = data.lifetime
	
	scale = data.scale
	
	var mousePos = get_global_mouse_position()
	data.velocity = global_position.direction_to(mousePos) * data.speed
	
	look_at(mousePos)
	
	if data.behaviors.size():
		for behavior in data.behaviors:
			behavior.applyEffect(self)
	
	if data.onFire.size():
		for onFire in data.onFire:
			onFire.triggerEffect(self)

func _process(delta):
	#d += delta
	position += data.velocity * delta
	
	#position = Vector2(
		#sin(d * 6) * 50,
		#cos(d * 6) * 50
	#) + Global.player.global_position

func _on_area_entered(area):
	spawnImpact()
	if data.onHit.size():
		for onHit in data.onHit:
			onHit.triggerEffect(self)
	
	data.numberOfImpacts -= 1
	if data.numberOfImpacts <= 0:
		destroy()

func _on_timer_timeout():
	destroy()

func destroy():
	queue_free()

func _on_body_entered(body):
	if body is TileMap:
		spawnImpact()
		destroy()

func spawnImpact():
	var impact = preload("res://components/impact/impact.tscn").instantiate()
	impact.global_position = global_position
	impact.rotation = rotation
	Global.game.call_deferred("add_child", impact)

