extends Control

func _ready():
	SceneLoader.current_scene = self
	focus()
	%Options.connect("return_focus", self.focus)
	
func focus():
	%StartButton.grab_focus()

func _on_start_button_pressed():
	UiSounds.mouse_click()
	SceneLoader.load_lvl1()

func _on_options_button_pressed():
	UiSounds.mouse_click()
	%Options.show()
	%Options.focus()

func _on_credits_button_pressed():
	UiSounds.mouse_click()

func _on_exit_button_pressed():
	UiSounds.mouse_click()
	SceneLoader.exit()

func _on_mouse_over():
	UiSounds.mouse_over()
func _on_focus_entered():
	UiSounds.mouse_over()
