extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_direction * speed
	_turn_sprite(velocity.x)

func _physics_process(delta):
	get_input()
	move_and_slide()

func _turn_sprite(dir):
	if(!%AnimatedSprite2D.flip_h && dir >0):
		%AnimatedSprite2D.flip_h = true
	if(%AnimatedSprite2D.flip_h && dir <0):
		%AnimatedSprite2D.flip_h = false
