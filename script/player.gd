extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

@export var gravity = 400
@export var speed = 125
@export var jump_force = 250

@export var jumps_allowed = 2 # this is to implement a double jump or more

var curr_jumps = 0 # keeps count of jumps

func _physics_process(delta: float) -> void:
	# implements gravity
	if not is_on_floor():
		velocity.y += gravity*delta
		if velocity.y > 500:
			velocity.y = 500
	else:
		# resets jumps if player is on floor
		curr_jumps=0
	
	#implements jump
	if Input.is_action_just_pressed("jump") and curr_jumps < jumps_allowed:
		Audioplayer.play_sfx("jump")
		velocity.y = -jump_force
		curr_jumps+=1
	
	# identifies direction player is moving
	var direction = Input.get_axis("move_left","move_right")
	
	# keeps player facing the right direction
	if direction != 0: 
		animated_sprite.flip_h = (direction == -1)
	
	# allows player to move
	velocity.x = direction*speed
	
	move_and_slide()
	
	# changes animations
	update_animations(direction)
	
func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		#when player is in the air. If jump animation is implemented
		if velocity.y < 0:
			#animated_sprite.play("jump")
			animated_sprite.play("run")
		else:
			#animated_sprite.play("fall")
			animated_sprite.play("idle")
		
	
