class_name BaseMoveHandler
extends State

@export var animations: Dictionary[String, String]

func _on_process(_delta: float) -> void:
	pass

func _on_physics_process(_delta: float) -> void:
	pass

func _on_next_transitions() -> void:
	pass

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	pass

func change_dir() -> void:
	var input_dir: Vector2i = GameInputEvents.get_move_input()
	match input_dir:
		Vector2i.LEFT:
			animated_sprite.play(animations["left"])
		Vector2i.RIGHT:
			animated_sprite.play(animations["right"])
		Vector2i.UP:
			animated_sprite.play(animations["back"])
		Vector2i.DOWN:
			animated_sprite.play(animations["front"])
		_:
			animated_sprite.play(animations["front"])
	

