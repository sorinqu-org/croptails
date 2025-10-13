class_name DamageComponent
extends Node

@export var health: int = 3
var current_health: int = 0

signal die

func apply_damage(damage: int) -> void:
    current_health = clamp(current_health + damage, 0, health)
    if current_health == health:
        die.emit()
