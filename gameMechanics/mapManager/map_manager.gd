class_name MapManager extends Node2D

@export var noiseHeigtTexture: NoiseTexture2D

func _ready():
	Global.mapManager = self
	loadMap("res://maps/training.tscn", null)

func loadMap(mapPath: String, previousMap: Node2D):		
	var loadedMap: PackedScene = load(mapPath)
	var map = loadedMap.instantiate()

	if previousMap:
		#remove_child(previousMap)
		previousMap.queue_free()
	
	add_child(map)
