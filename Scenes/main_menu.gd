extends Control

func _ready():
	SceneLoader.current_scene = self

func _on_start_button_pressed():
	UiSounds.mouse_click()
	SceneLoader.load_test()

func _on_options_button_pressed():
	UiSounds.mouse_click()
	%Options.show()

func _on_credits_button_pressed():
	UiSounds.mouse_click()

func _on_exit_button_pressed():
	UiSounds.mouse_click()
	SceneLoader.exit()

func _on_mouse_over():
	UiSounds.mouse_over()
