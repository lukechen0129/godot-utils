class_name SoundEffectSettings extends Resource

enum SOUND_EFFECT_TYPE {
	BACKGROUND_MUSIC,
}

@export_range(0, 10) var limit: int = 5
## Self defined sound type enum
@export var type: SOUND_EFFECT_TYPE
@export var sound_effect: AudioStream
## Sound volume in db (-40db - 20db)
@export_range(-40, 20) var volume = 0
@export_range(0.0, 4.0, 0.01) var pitch_scale: float = 1.0
## Range of randomness added to the pitch to make difference when multiple sound played at once
@export_range(0.0, 1.0, 0.01) var pitch_randomness: float = 0.0
## BUS ID of the audio should be routed to
@export var audio_bus: Const.AUDIO_BUS_ID

var audio_count: int = 0

func has_open_limit() -> bool:
	return audio_count < limit

func change_audio_count(_amount: int) -> void:
	audio_count = max(0, audio_count + _amount)

func _on_audio_finished() -> void:
	change_audio_count(-1)