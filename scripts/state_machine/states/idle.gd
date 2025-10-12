extends BaseMoveHandler

func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	change_dir()

func _on_next_transitions() -> void:
	if GameInputEvents.is_move():
		transition.emit("Walk")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	pass
