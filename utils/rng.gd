extends Node

@onready var rng := RandomNumberGenerator.new()

# Determines if a proc happens based on the `rate`.
# `rate` ranges from 0 to 100 and represents the chance for 
# the proc to happen in % (e.g.: rate=20 means there is 20% chance for it to proc)
func isProc(rate: int) -> bool:
	return rng.randi_range(1, 100) <= rate
