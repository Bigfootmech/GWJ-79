extends Control

func _ready():
	%MusicSlider.value = Audio.music_volume
	%EffectsSlider.value = Audio.sounds_volume

func _on_accept_button_pressed():
	Audio.music_volume = %MusicSlider.value
	Audio.sounds_volume = %EffectsSlider.value
	hide()

func _on_cancel_button_pressed():
	hide()
