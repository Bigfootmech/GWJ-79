extends Control

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		_on_cancel_button_pressed()
		# Viewport.set_input_as_handled()

func _ready():
	%MasterSlider.value = Audio.music_volume
	%MusicSlider.value = Audio.music_volume
	%EffectsSlider.value = Audio.sounds_volume

func _on_accept_button_pressed():
	Audio.master_volume = %MasterSlider.value
	Audio.music_volume = %MusicSlider.value
	Audio.sounds_volume = %EffectsSlider.value
	Audio.reset_bus_volumes()
	hide()

func _on_cancel_button_pressed():
	Audio.reset_bus_volumes()
	hide()

func _on_master_slider_value_changed(value):
	Audio.set_volume_music(value)

func _on_music_slider_value_changed(value):
	Audio.set_volume_music(value)

func _on_effects_slider_value_changed(value):
	Audio.set_volume_sfx(value)
