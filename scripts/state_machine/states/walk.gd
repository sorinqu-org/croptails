extends BaseMoveHandler

@export var speed: int = 50

func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	change_dir()
	entity.velocity = GameInputEvents.get_move_input() * speed
	entity.move_and_slide()

func _on_next_transitions() -> void:
	if not GameInputEvents.is_move():
		transition.emit("Idle")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	pass
