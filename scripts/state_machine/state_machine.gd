#FIXME: Create NORMAL state machine

class_name StateMachine
extends Node

@export var initial_state: State
@export var entity: CharacterBody2D
@export var animated_sprite: AnimatedSprite2D

var states: Dictionary = {}
var current_state: State
var current_state_name: String

func _ready() -> void:

	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transition.connect(transition_to)
			child.entity = entity
			child.animated_sprite = animated_sprite
	
	if initial_state:
		initial_state._on_enter()
		current_state = initial_state


func _process(delta : float) -> void:
	if current_state:
		current_state._on_process(delta)


func _physics_process(delta: float) -> void:
	if current_state:
		current_state._on_physics_process(delta)
		current_state._on_next_transitions()


func transition_to(state_name : String, first_param, second_param) -> void:
	if state_name == current_state.name.to_lower():
		return
	
	var new_state = states.get(state_name.to_lower())
	
	if !new_state:
		return
	
	if current_state:
		current_state._on_exit()
	
	new_state.first_param = first_param
	new_state.second_param = second_param
	
	new_state._on_enter()

	current_state = new_state
	current_state_name = current_state.name.to_lower()
	print("Current State: ", current_state_name)
