class_name GameInputEvents

static func get_move_input() -> Vector2i:
	var input_vector = Vector2i.ZERO

	if Input.is_action_pressed("walk_left"):
		input_vector = Vector2i.LEFT
	elif Input.is_action_pressed("walk_right"):
		input_vector = Vector2i.RIGHT
	if Input.is_action_pressed("walk_up"):
		input_vector = Vector2i.UP
	elif Input.is_action_pressed("walk_down"):
		input_vector = Vector2i.DOWN

	return input_vector

static func is_move() -> bool:
	return get_move_input() != Vector2i.ZERO
