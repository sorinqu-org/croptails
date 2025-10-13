extends Sprite2D

@onready var hurt: HurtComponent = $Hurt 
@onready var damage: DamageComponent = $Damage
@onready var health_bar: ProgressBar = $Control/TreeHp

@export var log_scene: PackedScene

func _ready() -> void:
	hurt.connect("hurt", Callable(self, "on_hurt"))
	damage.connect("die", Callable(self, "on_die"))

	health_bar.visible = false
	health_bar.max_value = damage.health
	health_bar.value = health_bar.max_value

func on_hurt(hit_damage: int) -> void:
	damage.apply_damage(hit_damage)

	health_bar.visible = true
	health_bar.value -= hit_damage

func on_die() -> void:
	call_deferred("spawn_log")
	health_bar.visible = false
	queue_free()

func spawn_log() -> void:
	var log_instance = log_scene.instantiate()
	log_instance.global_position = global_position
	get_parent().add_child(log_instance)
