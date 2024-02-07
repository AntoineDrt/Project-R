class_name Experience extends Node

# Determines how much xp is required to go up a level
const baseXp = 3

# Determines how much of an increase in xp each level will require
const levelUpFactor = 2.7

func computeXpRequired(level: int):
  return baseXp * (level * levelUpFactor)
