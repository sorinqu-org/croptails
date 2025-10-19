extends PanelContainer

@export var inventory_labels: Array[Label]

func _ready() -> void:
	InventoryComponent.connect("inventory_changed", Callable(self, "on_inventory_changed"))

func on_inventory_changed(resource: String) -> void:
	var inventory: Dictionary = InventoryComponent.inventory
	inventory_labels[inventory.keys().find(resource)].text = (" " + str(inventory[resource]))
