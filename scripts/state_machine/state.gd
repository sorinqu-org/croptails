class_name State 
extends Node

var animated_sprite: AnimatedSprite2D
var entity: CharacterBody2D

var first_param
var second_param

@warning_ignore("unused_signal")
signal transition

func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	pass

func _on_next_transitions() -> void:
	pass

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	animated_sprite.stop() 
