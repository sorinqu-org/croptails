class_name AnimHandler
extends Node

@export var animations: Dictionary[String, String]
@export var animated_sprite_path: NodePath

var isTool: bool = false
var tool_shape_pos: Vector2 = Vector2.ZERO
@export var tool_shape_positions: Dictionary[String, Vector2] = {
	"left": Vector2(-9, 0),
	"right": Vector2(9, 0),
	"front": Vector2(0, 0),
	"back": Vector2(0, 0)
}

var animated_sprite: AnimatedSprite2D = null
var dir: Vector2i
var not_zero_dir: Vector2i

func _enter() -> void:
	animated_sprite = get_node(animated_sprite_path) as AnimatedSprite2D
	print(animated_sprite)

func _exit() -> void:
	animated_sprite.stop()

func change_dir() -> void:
	if dir != Vector2i.ZERO:
		not_zero_dir = dir
	dir = GameInputEvents.get_move_input()

func change_anim() -> void:
	if isTool:
		match dir:
			Vector2i.LEFT:
				tool_shape_pos = tool_shape_positions["left"]
			Vector2i.RIGHT:
				tool_shape_pos = tool_shape_positions["right"]
			Vector2i.UP:
				tool_shape_pos = tool_shape_positions["back"]
			Vector2i.DOWN:
				tool_shape_pos = tool_shape_positions["front"]
			_:
				tool_shape_pos = tool_shape_positions["front"]

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
