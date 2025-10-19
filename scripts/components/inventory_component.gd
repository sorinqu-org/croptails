# FIXME: поменять логику компонента и сделать его дочерним для игрока,
# в данный момент он является глобальным

extends Node

var inventory: Dictionary = {
	"Wood": 0,
	"Stone": 0,
	"Corn": 0,
	"Tomato": 0,
	"Milk": 0,
	"Egg": 0
}
signal inventory_changed(resource: String)

func add_collectable(collectable: ResourceComponent.Resources) -> void:
	var collectable_name = str(ResourceComponent.Resources.find_key(collectable))

	inventory.get(collectable_name)
	inventory[collectable_name] += 1

	print("Collectable is: ", collectable_name)
	inventory_changed.emit(collectable_name)
