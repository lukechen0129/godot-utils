class_name SoundEffectSettings extends Resource

enum SOUND_EFFECT_TYPE {
	BACKGROUND_MUSIC,
}

enum AUDIO_BUS_ID {
	MASTER,
	BGM,
	SOUND_FX,
}

@export_range(0, 10) var limit: int = 5
@export var type: SOUND_EFFECT_TYPE
@export var sound_effect: AudioStream
@export_range(-40, 20) var volume = 0
@export_range(0.0, 4.0, 0.01) var pitch_scale: float = 1.0
@export_range(0.0, 1.0, 0.01) var pitch_randomness: float = 0.0
@export var audio_bus: AUDIO_BUS_ID

var audio_count: int = 0

func has_open_limit() -> bool:
	return audio_count < limit

func change_audio_count(_amount: int) -> void:
	audio_count = max(0, audio_count + _amount)

func _on_audio_finished() -> void:
	change_audio_count(-1)