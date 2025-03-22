extends Control

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		_on_cancel_button_pressed()
		# Viewport.set_input_as_handled()

func _ready():
	%MusicSlider.value = Audio.music_volume
	%EffectsSlider.value = Audio.sounds_volume

func _on_accept_button_pressed():
	Audio.music_volume = %MusicSlider.value
	Audio.sounds_volume = %EffectsSlider.value
	hide()

func _on_cancel_button_pressed():
	hide()
