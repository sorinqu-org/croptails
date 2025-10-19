extends BasePlayerState

@export var speed: int = 50
@export var player: Player   

func physics_process(_delta: float) -> void:
	anim_handler.change_dir()
	anim_handler.change_anim()
	
	player.velocity = anim_handler.dir * speed
	player.move_and_slide()

	if not GameInputEvents.is_move():
		transition.emit(self, "Idle", anim_handler.not_zero_dir)
