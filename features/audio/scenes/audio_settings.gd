extends Node2D

@export var slider_container: Node

func _on_apply_button_pressed() -> void:
    for child in slider_container.get_children():
        AudioServer.set_bus_volume_db(
            child.get_audio_bus_id(), 
            child.get_db()
        )
