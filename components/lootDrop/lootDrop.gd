extends Node2D

@onready var GoldCoinScene: PackedScene = preload("res://scenes/loot/goldCoin/goldCoin.tscn")
#@onready var World = get_node("/root/World")

func drop_loot():
	pass
	#var goldCoin: Node2D = GoldCoinScene.instantiate()
	#World.add_child(goldCoin)
	#goldCoin.global_position = global_position
