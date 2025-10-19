class_name CollectableComponent
extends Area2D

@export var resource_type: ResourceComponent.Resources

func _on_body_entered(_body: Node2D) -> void:
	InventoryComponent.add_collectable(resource_type)
	get_parent().queue_free()
