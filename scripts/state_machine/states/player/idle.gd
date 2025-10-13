extends BasePlayerState

@export var player: Player

func on_process(_delta: float) -> void:
	pass

func physics_process(_delta: float) -> void:  
	if GameInputEvents.is_move():
		transition.emit(self, "Walk", null)
	
	if GameInputEvents.get_hit_input():
		match player.current_tool:
			Player.Tools.Axe:
				transition.emit(self, "Chopping", anim_handler.dir)
			Player.Tools.WateringCan:
				transition.emit(self, "Watering", anim_handler.dir)
			Player.Tools.Hoe:
				transition.emit(self, "Tilling", anim_handler.dir)

func enter() -> void:
	super.enter()
	if param1 != null:
		anim_handler.dir = param1
	anim_handler.change_anim()
