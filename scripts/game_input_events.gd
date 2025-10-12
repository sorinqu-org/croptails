class_name GameInputEvents

# FIXME: Change tools system
@warning_ignore("unused_signal")
signal hit_pressed

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

# FIXME: Change tools system
static func get_hit_input() -> bool:
	return Input.is_action_just_pressed("hit")
