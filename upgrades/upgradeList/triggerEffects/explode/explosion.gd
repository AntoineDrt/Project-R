extends PlayerHitbox

func _ready():
	hit = computeHit()
	hit.damage *= 3
	$AnimationPlayer.play("explode")
	
func destroy():
	queue_free()
