extends Node2D

func _input(event):
	if !%Options.visible && event.is_action_pressed("ui_menu_open"):
		%Options.visible = true
		%Options.focus()
