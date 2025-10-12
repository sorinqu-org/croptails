extends BaseMoveHandler

func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	pass

func _on_next_transitions() -> void:
	if GameInputEvents.is_move():
		transition.emit("Walk", null, null)

func _on_enter() -> void:
	if first_param != null:
		dir = first_param
	change_anim()

func _on_exit() -> void:
	pass
