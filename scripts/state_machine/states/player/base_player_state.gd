class_name BasePlayerState
extends State

var anim_handler: AnimHandler

func _ready() -> void:
    anim_handler = get_child(0) as AnimHandler
    print(anim_handler.name)
    anim_handler._enter()

func process(_delta: float) -> void:
    pass

func enter() -> void:
    pass

func physics_process(_delta: float) -> void:
    pass

func exit() -> void:
    anim_handler._exit()
