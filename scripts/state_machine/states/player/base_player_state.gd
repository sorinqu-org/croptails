class_name BasePlayerState
extends State

var anim_handler: AnimHandler

func process(_delta: float) -> void:
    pass

func physics_process(_delta: float) -> void:
    pass

func enter() -> void:
    anim_handler = get_child(0) as AnimHandler
    print(anim_handler.name)
    anim_handler._enter()

func exit() -> void:
    anim_handler._exit()
