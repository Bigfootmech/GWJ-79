extends RigidBody2D

var death_sound = preload("res://Entities/Rat/Fruit_Eat_02.ogg")

func _ready():
	$AnimatedSprite2D.play("idle")
	
func on_death():
	$AnimatedSprite2D.play("die")
	$AudioStreamPlayer2D.stream = death_sound
	$AudioStreamPlayer2D.play()

func _on_timer_timeout():
	on_death()
	pass # Replace with function body.
