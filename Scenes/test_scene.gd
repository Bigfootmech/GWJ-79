extends Node2D

func _input(event):
	if !%Options.visible && event.is_action_pressed("ui_menu_open"):
		print(%Options.visible)
		%Options.visible = true
		print("opened!")
