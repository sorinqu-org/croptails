class_name Tool
extends BasePlayerState

func process(_delta: float) -> void:
    if !anim_handler.animated_sprite.is_playing():
        transition.emit(self, "Idle", anim_handler.dir)

func enter() -> void:
    super.enter()
    if param1 != null:
        anim_handler.dir = param1
        anim_handler.change_anim()
