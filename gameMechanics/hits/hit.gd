class_name Hit extends Node

enum Kind {
  Regular, 
  Critical
}

var damage: int = 0

var kind: Kind = Kind.Regular

func _init(_damage: float, _kind: Kind):
  damage = _damage
  kind = _kind
