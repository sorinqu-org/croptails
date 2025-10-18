class_name HitComponent
extends Area2D

@export var damage: int = 1
@onready var player: Player = $".."
var current_tool: Player.Tools = Player.Tools.None

func _ready() -> void:
	current_tool = player.current_tool
	player.connect("update_tool", Callable(self, "on_tool_update"))

func on_tool_update(tool: Player.Tools):
	current_tool = tool
