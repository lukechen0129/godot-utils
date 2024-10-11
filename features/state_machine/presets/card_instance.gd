class_name CardInstance extends Control

@warning_ignore("unused_signal")
signal reparent_requested(card_instance: CardInstance, index: int)
@warning_ignore("unused_signal")
signal on_released_in_drop_area()

@onready var collider = $Collider
@onready var card_state_machine = $CardStateMachine

@onready var targets: Array[Node] = []

func _ready() -> void:
	card_state_machine.init(self)

# signal callbacks
func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)

func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)

func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()

func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()

func _on_collider_area_entered(area: Area2D) -> void:
	if not targets.has(area):
		targets.append(area)

func _on_collider_area_exited(area: Area2D) -> void:
	targets.erase(area)