class_name VolumeSlider extends VBoxContainer

@export var bus_id: Const.AUDIO_BUS_ID

@onready var label = $Label
@onready var slider = $Slider

func _ready() -> void:
    label.text = AudioServer.get_bus_name(bus_id)
    slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_id))

func get_db() -> float:
    return linear_to_db(slider.value)

func get_audio_bus_id() -> int:
    return bus_id