class_name StateMachine extends Node

@export var initial_state: State

var current_state: State
var states := {}

func init(root: Node) -> void:
	for child in get_children():
		if child is State:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.root = root
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state


func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)

func on_gui_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_gui_input(event)

func on_mouse_entered() -> void:
	if current_state:
		current_state.on_mouse_entered()

func on_mouse_exited() -> void:
	if current_state:
		current_state.on_mouse_exited()

## provide enum States for param `to`
func _on_transition_requested(from: State, to: int) -> void:
	if from != current_state:
		return
	
	# check if new state is valid
	var new_state: State = states[to]

	if not new_state:
		return
	
	if current_state:
		current_state.exit()

	new_state.enter()
	current_state = new_state
