extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DASH_SPEED = 700
var dashing = false
var can_dash = true

#const dashspeed = 1200
#const dashlenght = .1
#s
#@onready var dash = $Dash


# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity = 0


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		$dash_timer.start()
		$dash_again_timer.start()

	var mouse_pst = get_viewport().get_mouse_position()
	look_at(mouse_pst)
	
	var directionX = Input.get_axis("LEFT", "RIGHT")
	var directionY = Input.get_axis("UP", "DOWN")
	if not directionX and not directionY: 
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	elif directionX and not directionY:
		velocity.x = directionX * SPEED
		velocity.y = move_toward(velocity.y, 0, SPEED)
	elif directionY and not directionX:
		velocity.y = directionY * SPEED
		velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		velocity.x = directionX * SPEED
		velocity.y = directionY * SPEED
	if dashing:
		velocity.x = directionX * DASH_SPEED
		velocity.y = directionY * DASH_SPEED
	else:
		velocity.x = directionX * SPEED
		velocity.y = directionY * SPEED

	move_and_slide()


func _on_dash_timer_timeout():
	dashing = false


func _on_dash_again_timeout():
	can_dash = true 
