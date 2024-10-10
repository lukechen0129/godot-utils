extends Node2D

@export var sound_effect_settings: Array[SoundEffectSettings]

var sound_effect_lookup = {}

func _ready() -> void:
	for setting: SoundEffectSettings in sound_effect_settings:
		sound_effect_lookup[setting.type] = setting

func play_2d_audio_at_position(_position: Vector2, _type: SoundEffectSettings.SOUND_EFFECT_TYPE) -> void:
	if sound_effect_lookup.has(_type):
		var _setting: SoundEffectSettings = sound_effect_lookup[_type]

		if _setting.has_open_limit():
			_setting.change_audio_count(1)
			var _new_audio = AudioStreamPlayer2D.new()
			
			add_child(_new_audio)

			_new_audio.position = _position
			_new_audio.stream = _setting.sound_effect
			_new_audio.volume_db = _setting.volume
			_new_audio.pitch_scale = _setting.pitch_scale
			_new_audio.pitch_scale += randf_range(-_setting.pitch_randomness, _setting.pitch_randomness)
			_new_audio.bus = _setting.audio_bus
			_new_audio.finished.connect(_setting._on_audio_finished)
			_new_audio.finished.connect(_new_audio.queue_free)

			_new_audio.play()

	else:
		push_error("AudioManager failed to find the setting for type: ", _type)
