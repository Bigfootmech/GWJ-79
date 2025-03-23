extends CharacterBody2D

# Get Gravity from project settings
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var speed = 7000
@export var JUMP_VELOCITY = 380.0

var size = 1.0

func _input(event):
	if event.is_action_pressed("jump"):
		jump()
	if event.is_action_pressed("attack"):
		attack()

func _physics_process(delta):
	_set_move(delta)
	_apply_gravity(delta)
	_reset_animation()
	_set_animation()
	
	move_and_slide()
	_process_collisions()
	
func _set_move(delta):
	var input_direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_direction * speed * delta
	
	_turn_sprite()
	
func _apply_gravity(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
	
func jump():
	if(is_on_floor()): # don't jump in the air
		%AnimatedSprite2D.play("jump")
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
	if(!is_on_floor()):
		__select_animation("jump")
		return
	if(is_moving()):
		__select_animation("walk")
		return
	
	__select_animation("idle")

		
func _on_animated_sprite_2d_animation_finished():
	__select_animation("idle")
	%AnimatedSprite2D.play("idle")
	
func _reset_animation():
	if is_on_floor() && !%AnimatedSprite2D.is_playing():
		%AnimatedSprite2D.play("idle")
	
func __select_animation(string: String) -> void:
	%AnimatedSprite2D.animation = string

func is_attacking() -> bool:
	return Input.is_action_pressed("attack")
	# return %AnimatedSprite2D.animation == "attack"
	
func is_moving() -> bool:
	return velocity.x != 0

func _process_collisions():
	for i in get_slide_collision_count():
		var collision: KinematicCollision2D = get_slide_collision(i)
		var collider = collision.get_collider()
		
		if(is_at_end_of_level(collider)):
			LevelComplete()
			
		if(is_out_of_bounds(collider)):
			GameOver()
		
		if(_collider_is_floor(collider)):
			_reset_animation()
		
		if(is_attacking() && _collider_is_consumable(collider)):
			consume(collider)
		
func _collider_is_consumable(collider) -> bool:
	return (collider is Node) && collider.is_in_group("Consumable")
		
func _collider_is_floor(collider) -> bool:
	return (collider is Node) && collider.is_in_group("Floor")
	
func consume(collider: Node):
	collider.queue_free()
	size += 0.2
	
	scale = Vector2(size,size)

func is_out_of_bounds(collider) -> bool:
	return (collider is Node) && collider.is_in_group("Level_Bounds")
	
func is_at_end_of_level(collider) -> bool:
	return (collider is Node) && collider.is_in_group("Level_Complete")
	
	
func GameOver():
	#print("game over!!!")
	# SceneLoader.pause_level()
	get_parent().get_child(0).popup_centered()
	#get_tree().paused = true
	
func LevelComplete():
	#SceneLoader.load_next_level()
	GlobUi.Win()
