class_name AnimHandler
extends State

@export var animations: Dictionary[String, String]
@export var player: Player

var dir: Vector2i
var not_zero_dir: Vector2i
var isTool: bool = false

func AH_on_process(_delta: float) -> void:
	pass

func AH_on_physics_process(_delta: float) -> void:
	pass

func AH_on_next_transitions() -> void:
	if !animated_sprite.is_playing():
		if isTool:
			transition.emit("Idle", not_zero_dir, null)

func AH_on_enter() -> void:
	pass

func AH_on_exit() -> void:
	animated_sprite.stop()

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
