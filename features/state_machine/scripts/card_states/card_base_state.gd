extends CardState

var is_mouse_hovering: bool = false

func enter() -> void:
	# wait for card ui ready since this is the initial state
	if not root.is_node_ready():
		await root.ready
	
	is_mouse_hovering = false

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse") and is_mouse_hovering:

		transition_requested.emit(self, CardState.States.CLICKED)
		
		return
	
	if event.is_action_pressed("right_mouse"):
		return

func on_mouse_entered() -> void:
	is_mouse_hovering = true
	
func on_mouse_exited() -> void:
	if (is_mouse_hovering):
		is_mouse_hovering = false
