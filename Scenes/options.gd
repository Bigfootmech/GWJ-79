extends Control

signal return_focus

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		_on_cancel_button_pressed()
		# Viewport.set_input_as_handled()

func _ready():
	%MasterSlider.value = Audio.master_volume
	%MusicSlider.value = Audio.music_volume
	%EffectsSlider.value = Audio.sounds_volume
	%UISlider.value = Audio.ui_volume
	
func focus():
	%AcceptButton.grab_focus()

func _on_accept_button_pressed():
	UiSounds.mouse_click()
	Audio.master_volume = %MasterSlider.value
	Audio.music_volume = %MusicSlider.value
	Audio.sounds_volume = %EffectsSlider.value
	Audio.ui_volume = %UISlider.value
	Audio.reset_bus_volumes()
	hide()
	return_focus.emit()

func _on_cancel_button_pressed():
	UiSounds.mouse_click()
	Audio.reset_bus_volumes()
	hide()
	return_focus.emit()

func _on_mouse_over():
	UiSounds.mouse_over()
	
	
func _on_master_slider_value_changed(value):
	Audio.set_volume_master(value)

func _on_music_slider_value_changed(value):
	Audio.set_volume_music(value)

func _on_effects_slider_value_changed(value):
	Audio.set_volume_sfx(value)

func _on_ui_slider_value_changed(value):
	Audio.set_volume_ui(value)
