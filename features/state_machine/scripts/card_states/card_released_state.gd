extends CardState

var is_played: bool

func enter() -> void:
	is_played = false
	
	if not root.targets.is_empty():
		is_played = true
		root.on_released_in_drop_area.emit()
	
func on_input(_event: InputEvent) -> void:
	if is_played:
		return
	
	transition_requested.emit(self, CardState.States.BASE)
