extends State

@export var character: NonPlayableCharacter
@export var anim_sprite: AnimatedSprite2D


@export_group("Navigation")
@export var nav_agent: NavigationAgent2D
@export var min_speed: float = 5.0
@export var max_speed: float = 10.0

var speed: float

func _ready() -> void:
    nav_agent.velocity_computed.connect(on_safe_velocity_computed)
    call_deferred("character_setup")

func character_setup() -> void:
    await get_tree().physics_frame
    set_move_target()

func set_move_target() -> void:    
    randomize()
    var target_pos: Vector2 = NavigationServer2D.map_get_random_point(
        nav_agent.get_navigation_map(),
        nav_agent.navigation_layers,
        false)
    
    nav_agent.target_position = target_pos
    speed = randf_range(min_speed, max_speed)

func physics_process(_delta: float) -> void:

    if nav_agent.is_navigation_finished():    
        character.current_walk_cycle += 1        
        set_move_target()
        next_transition()       
        return

    var target_pos: Vector2 = nav_agent.get_next_path_position()
    var target_dir: Vector2 = character.global_position.direction_to(target_pos)
    anim_sprite.flip_h = target_dir.x < 0

    var velocity: Vector2 = target_dir * speed
    if nav_agent.avoidance_enabled:
        anim_sprite.flip_h = velocity.x < 0
        nav_agent.velocity = velocity
    else:
        character.velocity = velocity
        character.move_and_slide()

func next_transition() -> void:
    if character.current_walk_cycle == character.walk_cycles:
        character.velocity = Vector2.ZERO
        transition.emit(self, "Idle", null)

func on_safe_velocity_computed(safe_velocity: Vector2) -> void:
    anim_sprite.flip_h = safe_velocity.x < 0
    character.velocity = safe_velocity
    character.move_and_slide()

func enter() -> void:
    anim_sprite.play("walk")
    character.current_walk_cycle = 0
    set_move_target()

func exit() -> void:
    anim_sprite.stop()
