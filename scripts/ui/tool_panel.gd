extends PanelContainer

@export var buttons: Array[Button]

var player: Player
var focused_button: Button

func _ready() -> void:
	var current_scene: int = get_tree().root.get_child_count() - 1
	for child in get_tree().root.get_child(current_scene).get_children():
		print(child.name)
		if child is Player:
			player = child
			player.connect("update_tool", Callable(self, "on_tool_updated"))

	for button in buttons:
		button.connect("pressed", Callable(self, "on_button_pressed"))

func on_tool_updated(tool: Player.Tools):
	if tool != Player.Tools.None:
		var button = buttons[tool-1]
		button.grab_focus()
		focused_button = button

func on_button_pressed():
	for button in buttons:
		if button.has_focus():
			focused_button = button
			player.emit_update_tool(buttons.find(button) + 1 as Player.Tools)

func _unhandled_input(event: InputEvent) -> void:
	if GameInputEvents.unselect_input(event):
		if focused_button:
			focused_button.release_focus()
		player.emit_update_tool(Player.Tools.None)
