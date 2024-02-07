extends Node

signal playerSet(data: Player)

var player: Player
var perkScreen: PerkScreen
var mapManager: MapManager
var game: Node2D
var camera: Camera2D
var tooltip: ItemTooltip

var isUiOpened = false

func frameFreeze(timeScale: float, duration: float):
	Engine.time_scale = timeScale
	await get_tree().create_timer(duration * timeScale).timeout
	Engine.time_scale = 1.0

func setPlayer(data: Player):
	player = data
	emit_signal("playerSet", player)
