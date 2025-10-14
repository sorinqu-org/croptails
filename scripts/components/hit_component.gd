class_name HitComponent
extends Area2D

@export var damage: int = 1
@onready var player: Player = $".."
var current_tool: Player.Tools = Player.Tools.None

func _ready() -> void:
	current_tool = player.current_tool
