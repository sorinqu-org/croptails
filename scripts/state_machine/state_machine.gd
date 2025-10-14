class_name StateMachine
extends Node

# Я переписал ее с нуля, тут был очень непонятный код
# Даже я новичок понимаю что код у автора так себе, можеет он и гений, но я не понимаю что он там написал)

@export var initial_state: State

var states: Dictionary = {}
var current_state: State

func _ready() -> void:
    for child in get_children():
        if child is State:
            var state: State = child as State
            states[state.name.to_lower()] = state
            state.transition.connect(transition_to)
    
    if initial_state:
        initial_state.enter()
        current_state = initial_state

func _process(delta : float) -> void:
    if current_state:
        current_state.process(delta)


func _physics_process(delta: float) -> void:
    if current_state:
        current_state.physics_process(delta)


func transition_to(state: State, state_name: String, param1) -> void:
    if state != current_state:
        return
    
    var new_state: State = states.get(state_name.to_lower())
    if !new_state:
        return
    
    if current_state:
        new_state.param1 = param1
        current_state.exit()
    
    new_state.enter()
    current_state = new_state
