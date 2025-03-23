extends Node

var test_preload = preload("res://Scenes/test_scene.tscn")
var lvl1_preload = preload("res://Scenes/Level_1.tscn")
var menu_preload = preload("res://Scenes/Main_Menu.tscn")
var options_preload = preload("res://Scenes/Options.tscn")

var current_scene: Node
var current_scene_name = "Main_Menu"

func pause_level():
	current_scene.paused = !current_scene.paused

func load_test():
	load_scene(test_preload)
	
func load_lvl1():
	load_scene(lvl1_preload)

func load_main_menu():
	load_scene(menu_preload)

func load_options_menu():
	load_scene(options_preload)

func exit():
	get_tree().quit()

func load_scene(preloaded):
	unload_current_scene()
	
	var obj: Node = preloaded.instantiate()
	current_scene = obj
	# current_scene_name = obj.name
	get_tree().get_root().add_child(obj)
	
func unload_current_scene():
	current_scene.queue_free()
#	for child in get_tree().get_root().get_children():
#		if(child.name == current_scene_name):
#			child.queue_free()
