extends State

@export var character: CharacterBody2D
@export var anim_sprite: AnimatedSprite2D
@export var min_interval: float = 1.0
@export var max_inteval: float = 7.0

@onready var timer: Timer = Timer.new()

func _ready() -> void:
    timer.wait_time = randf_range(min_interval, max_inteval)
    timer.timeout.connect(on_timer_timeout)
    add_child(timer)

func enter() -> void:
    anim_sprite.play("idle")
    timer.start()

func exit() -> void:
    anim_sprite.stop()
    timer.stop()

func on_timer_timeout():
    transition.emit(self, "Walk", null)
