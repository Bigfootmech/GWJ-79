extends Control

func _on_start_button_pressed():
	SceneLoader.load_test()

func _on_options_button_pressed():
	%Options.show()

func _on_credits_button_pressed():
	pass # Replace with function body.

func _on_exit_button_pressed():
	SceneLoader.exit()
