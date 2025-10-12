class_name Chopping
extends AnimHandler

func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	pass

func _on_next_transitions() -> void:
	AH_on_next_transitions()

func _on_enter() -> void:
	if first_param != null:
		dir = first_param
	change_anim()

	isTool = true

func _on_exit() -> void:
	AH_on_exit()
