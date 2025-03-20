extends Control

var scene_preload = preload("res://Scenes/test_scene.tscn")

func _on_start_button_pressed():
	get_node("/root/MainMenu").queue_free()
	get_tree().get_root().add_child(scene_preload.instantiate())

func _on_options_button_pressed():
	pass # Replace with function body.

func _on_credits_button_pressed():
	pass # Replace with function body.

func _on_exit_button_pressed():
	get_tree().quit()
