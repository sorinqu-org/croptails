class_name Player
extends CharacterBody2D

@export var current_tool: Tools = Tools.None

signal update_tool(tool: Tools)

func emit_update_tool(tool: Tools):
	current_tool = tool
	update_tool.emit(tool)

func _input(event: InputEvent) -> void:
	if GameInputEvents.get_tool_input():
		var pressed_key = event.as_text()
		current_tool = int(pressed_key) as Tools
		update_tool.emit((int(pressed_key) as Tools))

enum Tools {
	None,
	Axe,
	Hoe,
	WateringCan,
	Corn,
	Tomato
}
