extends Area2D

signal playerAccepted

@export var instructionText: String 

func _ready():
	%Instruction.visible = false
	%Instruction.text = instructionText

func _input(event: InputEvent):
	if event.is_action_pressed("ui_accept") && %Instruction.visible:
		emit_signal("playerAccepted")

func _on_area_entered(area):
	%Instruction.visible = true

func _on_area_exited(area):
	%Instruction.visible = false
