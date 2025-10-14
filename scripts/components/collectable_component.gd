class_name CollectableComponent
extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	print("Collected")
	get_parent().queue_free()
