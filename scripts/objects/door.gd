extends StaticBody2D

@onready var anim: AnimatedSprite2D = $DoorAnim
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var interactable_component: InteractableComponent = $InteractableComponent

func _ready() -> void:
    interactable_component.connect("interactable_activated", Callable(self, "on_door_interacted"))
    interactable_component.connect("interactable_deactivated", Callable(self, "on_door_deactivated"))

    collision_layer = 1

func on_door_interacted() -> void:
    anim.play("open_door")
    collision_layer = 2

func on_door_deactivated() -> void:
    anim.play("close_door")
    collision_layer = 1
