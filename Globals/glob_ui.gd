extends Control

func Win():
	$WinDialog.popup_centered()


func _on_win_dialog_confirmed():
	back_to_main_menu()

func _on_win_dialog_canceled():
	back_to_main_menu()

func back_to_main_menu():
	SceneLoader.load_main_menu()
