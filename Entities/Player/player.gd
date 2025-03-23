extends CharacterBody2D

# Get Gravity from project settings
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var speed = 7000
@export var JUMP_VELOCITY = 380.0

func _input(event):
	if event.is_action_pressed("jump"):
		jump()
	if event.is_action_pressed("attack"):
		attack()

func _physics_process(delta):
	_set_move(delta)
	_apply_gravity(delta)
	_set_animation()
	
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
			
func animation_idle():
	%AnimatedSprite2D.animation = "idle"
	#%AnimatedSprite2D.animation_finished.disconnect(self.animation_idle)
			
func attack():
	%AnimatedSprite2D.animation = "attack"
	#%AnimatedSprite2D.animation_finished.connect(self.animation_idle)
	
	
func _turn_sprite():
	if(!%AnimatedSprite2D.flip_h && velocity.x >0):
		%AnimatedSprite2D.flip_h = true
	if(%AnimatedSprite2D.flip_h && velocity.x <0):
		%AnimatedSprite2D.flip_h = false

func _set_animation():
	if(is_attacking()):
		__select_animation("attack")
		return
	if(is_moving()):
		__select_animation("walk")
		return
	
	__select_animation("idle")
		
func _on_animated_sprite_2d_animation_finished():
	__select_animation("idle")
	%AnimatedSprite2D.play("idle")
		
func __select_animation(string: String) -> void:
	%AnimatedSprite2D.animation = string

func is_attacking() -> bool:
	return Input.is_action_pressed("attack")
	# return %AnimatedSprite2D.animation == "attack"
	
func is_moving() -> bool:
	return velocity.x != 0
