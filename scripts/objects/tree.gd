extends Sprite2D

@onready var hurt: HurtComponent = $Hurt 
@onready var damage: DamageComponent = $Damage
@onready var health_bar: ProgressBar = $Control/Health

@export var resource_scene: PackedScene
@export var shake_time: float = 1

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
	
	material.set_shader_parameter("shake_intensity", 1.0)
	await get_tree().create_timer(shake_time).timeout
	material.set_shader_parameter("shake_intensity", 0.0)

func on_die() -> void:
	call_deferred("spawn_resource")
	health_bar.visible = false
	queue_free()

func spawn_resource() -> void:
	var log_instance = resource_scene.instantiate()
	log_instance.global_position = global_position
	get_parent().add_child(log_instance)
