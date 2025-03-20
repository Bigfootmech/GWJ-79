extends AcceptDialog

var scene_preload = preload("res://Scenes/Main_Menu.tscn")

func _on_confirmed():
	get_node("/root/TestScene").queue_free()
	get_tree().get_root().add_child(scene_preload.instantiate())

func _on_canceled():
	get_tree().quit()
