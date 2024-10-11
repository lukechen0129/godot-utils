extends CardState

func enter() -> void:
	root.collider.monitoring = true

func on_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		transition_requested.emit(self, CardState.States.DRAGGING)
