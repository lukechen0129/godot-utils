extends Control

@export var health_bar: Node

func _on_damage_button_pressed() -> void:
	health_bar.set_current_value(health_bar.current_value - 10)
