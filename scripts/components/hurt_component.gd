class_name HurtComponent
extends Area2D

@export var tool: Player.Tools = Player.Tools.None

signal hurt(damage: int)

func _on_area_entered(area: Area2D) -> void:
    var hit = area as HitComponent
    if tool == hit.current_tool:
        hurt.emit(hit.damage)
