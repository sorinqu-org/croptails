class_name GameInputEvents

static func get_move_input() -> Vector2i:
    var input_vector = Vector2i.ZERO
    input_vector = Vector2i(int(Input.get_axis("walk_left", "walk_right")), 
                            int(Input.get_axis("walk_up", "walk_down")))
    return input_vector

static func is_move() -> bool:
    return get_move_input() != Vector2i.ZERO
