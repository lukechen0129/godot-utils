extends Control

@export var main_bar: ProgressBar
@export var bottom_bar: ProgressBar

@export var min_value: float
@export var max_value: float
@export var current_value: float

@export var main_bar_tween_duration: float
@export var bottom_bar_tween_duration: float
@export var main_bar_tween_delay: float
@export var bottom_bar_tween_delay: float

func _ready() -> void:
    current_value = max_value
    init_bar_value(bottom_bar)
    init_bar_value(main_bar)

func set_min_value(_value: float) -> void:
    min_value = _value

func set_max_value(_value: float) -> void:
    max_value = _value

func set_current_value(_value: float) -> void:
    current_value = clampf(_value, min_value, max_value)

    update_bar_with_tween(main_bar, current_value, main_bar_tween_duration, main_bar_tween_delay)
    update_bar_with_tween(bottom_bar, current_value, bottom_bar_tween_duration, bottom_bar_tween_delay)

func set_all_values(_min: float, _max: float, _value: float) -> void:
    min_value = _min
    max_value = _max
    current_value = clampf(_value, _min, _max)

func init_bar_value(bar: ProgressBar) -> void:
    bar.min_value = min_value
    bar.max_value = max_value
    bar.value = current_value

func update_bar_with_tween(_bar: ProgressBar, _value: float, _duration: float, _delay: float = 0) -> void:
    var tween = create_tween()

    tween.tween_property(_bar, "value", _value, _duration).set_delay(_delay)