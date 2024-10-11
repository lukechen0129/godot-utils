class_name State extends Node

# define an enum to represent your States
# enum States {BASE, CLICKED, DRAGGING, AIMING, RELEASED}

@warning_ignore("unused_signal")
##use enum States for param `to`
signal transition_requested(from: State, to: int)

# Export a var state for the enum in your extended state class
# @export var state: States

var root: Node

## Procedures to run before enter the state
func enter() -> void:
	pass

## Procedures to run before exit the state
func exit() -> void:
	pass

func on_input(_event: InputEvent) -> void:
	pass

func on_gui_input(_event: InputEvent) -> void:
	pass

func on_mouse_entered() -> void:
	pass

func on_mouse_exited() -> void:
	pass
