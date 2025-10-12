class_name BaseMoveHandler
extends State

@export var animations: Dictionary[String, String]

var dir: Vector2i
var not_zero_dir: Vector2i 

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
	if dir != Vector2i.ZERO:
		not_zero_dir = dir
	dir = GameInputEvents.get_move_input()

func change_anim() -> void:
	match dir:
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

