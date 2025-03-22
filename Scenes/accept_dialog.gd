extends AcceptDialog

func _on_confirmed():
	SceneLoader.load_main_menu()

func _on_canceled():
	SceneLoader.exit()

func _on_timer_timeout():
	popup_centered()
