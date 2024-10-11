extends CardState

const DRAG_MINIMUM_THRESHOLD := 0.05

var is_minimum_drag_time_elapsed := false

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	if ui_layer:
		root.reparent(ui_layer)
	
	is_minimum_drag_time_elapsed = false
	var threshold_timer := get_tree().create_timer(DRAG_MINIMUM_THRESHOLD, false)
	threshold_timer.timeout.connect(func(): is_minimum_drag_time_elapsed = true)

func on_input(event: InputEvent) -> void:
	var is_mouse_moiton: bool = event is InputEventMouseMotion
	var is_canceled: bool = event.is_action_pressed("right_mouse")
	var is_confirmed: bool = event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse")
	
	if is_mouse_moiton:
		root.global_position = root.get_global_mouse_position() - root.pivot_offset

	if is_canceled:
		transition_requested.emit(self, CardState.States.BASE)
	elif is_confirmed and is_minimum_drag_time_elapsed:
		get_viewport().set_input_as_handled()
		transition_requested.emit(self, CardState.States.RELEASED)
