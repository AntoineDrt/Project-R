class_name ProjectileResource extends Resource

@export var sprite: Texture2D
@export var scene : PackedScene

@export var speed	 		:= 300.0
@export var velocity		:= Vector2.ZERO
@export var lifetime		:= 1.0
@export var scale			:= Vector2(0.5, 0.5)
@export var amount			:= 1
@export var numberOfImpacts	:= 1

# Upgrades

## Triggers
@export var onHit		: Array[TriggerEffectResource]
@export var onFire		: Array[TriggerEffectResource]

## Behaviors
@export var behaviors	: Array[BehaviorEffectResource]
