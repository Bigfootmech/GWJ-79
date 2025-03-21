extends Node

var test_preload = preload("res://Scenes/test_scene.tscn")
var menu_preload = preload("res://Scenes/Main_Menu.tscn")
var options_preload = preload("res://Scenes/Options.tscn")

func load_test():
	unload_scene()
	get_tree().get_root().add_child(test_preload.instantiate())

func load_main_menu():
	unload_scene()
	get_tree().get_root().add_child(menu_preload.instantiate())

func load_options_menu():
	unload_scene()
	get_tree().get_root().add_child(options_preload.instantiate())

func exit():
	get_tree().quit()

func unload_scene():
	for child in get_tree().get_root().get_children():
		if(child.name != "SceneLoader"):
			child.queue_free()
