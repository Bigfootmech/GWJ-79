extends CharacterBody2D

# Get Gravity from project settings
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var speed = 7000
@export var JUMP_VELOCITY = 380.0

func _input(event):
	if event.is_action_pressed("jump"):
		jump()

func _physics_process(delta):
	_set_move(delta)
	_apply_gravity(delta)
	
	move_and_slide()
	
func _set_move(delta):
	var input_direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_direction * speed * delta
	
	_turn_sprite()
	
func _apply_gravity(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
	
func jump():
	if(is_on_floor()): # don't jump in the air
		if(Input.is_action_pressed("ui_down")): # Jump Down
			position.y += 2
		else:
			velocity.y -= JUMP_VELOCITY # Jump
	
func _turn_sprite():
	if(!%AnimatedSprite2D.flip_h && velocity.x >0):
		%AnimatedSprite2D.flip_h = true
	if(%AnimatedSprite2D.flip_h && velocity.x <0):
		%AnimatedSprite2D.flip_h = false
