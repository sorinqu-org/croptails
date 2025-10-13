class_name Tool
extends BasePlayerState

@export var hit_collision: CollisionShape2D

func _ready() -> void:
    super._ready()
    anim_handler.isTool = true
    hit_collision.disabled = true
    hit_collision.position = Vector2(0, 0)

func process(_delta: float) -> void:
    if !anim_handler.animated_sprite.is_playing():
        transition.emit(self, "Idle", anim_handler.dir)

func enter() -> void:

    if param1 != null:
        anim_handler.dir = param1
        anim_handler.change_anim()    
        hit_collision.disabled = false
        hit_collision.position = anim_handler.tool_shape_pos

func exit() -> void:
    super.exit()
    hit_collision.disabled = true
