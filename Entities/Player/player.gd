extends CharacterBody2D

# Get Gravity from project settings
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var speed = 7000
@export var JUMP_VELOCITY = -380.0

func _physics_process(delta):
	var input_direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_direction * speed * delta
	_turn_sprite(velocity.x)
	
	if !is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()
	
func _turn_sprite(dir):
	if(!%AnimatedSprite2D.flip_h && dir >0):
		%AnimatedSprite2D.flip_h = true
	if(%AnimatedSprite2D.flip_h && dir <0):
		%AnimatedSprite2D.flip_h = false
