extends CharacterBody2D


const SPEED = 300.0
const WEAPONS = ["patada", "flor", "torta"]
const JUMP_VELOCITY = -400.0
const DASH_SPEED = 700
var dashing = false
var can_dash = true
var act_weapon = null 
var can_tortazo = true
var can_lagrima = true
@onready var animation_tree = $AnimationTree

@onready var bullet_spawn = $bullet_spawn
@export var bullet_scene: PackedScene
@onready var tortas_cooldown = $tortas_cooldown


@export var lagrimas_scene: PackedScene
@onready var lagrima_cooldown = $lagrima_cooldown
@onready var animation_player = $AnimationPlayer

@onready var walk = $walk


var gravity = 0 

func _ready():
	animation_tree.active

func _input(event):
	if event.is_action_pressed("patada"):
		act_weapon = WEAPONS[0]
	elif event.is_action_pressed("flor"):
		act_weapon = WEAPONS[1]
	elif event.is_action_pressed("torta"):
		act_weapon = WEAPONS[2]
	elif event.is_action_pressed("no_weapon"):
		act_weapon = null
	elif event.is_action_pressed("LEFT") or event.is_action_pressed("RIGHT"):
		$AnimationPlayer.play("walk right or left")
	elif event.is_action_pressed("shoot"):
		if act_weapon == WEAPONS[2]:
			$AnimationPlayer.play("disparar torta")
	elif event.is_action_pressed("DOWN"):
		$AnimationPlayer.play("walk down")
	elif event.is_action_pressed("UP"):
		$AnimationPlayer.play("walk up")
	
func _physics_process(delta):
	if not Input.is_action_pressed("DOWN") and not Input.is_action_pressed("shoot") and not Input.is_action_pressed("dash") and not Input.is_action_pressed("UP") and not Input.is_action_pressed("RIGHT") and not Input.is_action_pressed("LEFT") and can_tortazo:
		$AnimationPlayer.play("idle")
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		$dash_timer.start()
		$dash_again_timer.start()
		
	if act_weapon == WEAPONS[2]:
		var mouse_pst = get_viewport().get_mouse_position()
		if Input.is_action_just_pressed("shoot") and can_tortazo:
			fire()
	

	if act_weapon == WEAPONS[1]:
		var mouse_pst = get_viewport().get_mouse_position()
		if Input.is_action_just_pressed("shoot") and can_lagrima:
			fire_lagrima()
#movimiento
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
	
	if directionX > 0: 
		walk.scale.x = 0.1
	elif directionX < 0: 
		walk.scale.x = -0.1
		
#patada
		

	move_and_slide()

func _on_dash_timer_timeout():
	dashing = false

func _on_dash_again_timeout():
	can_dash = true 


func fire():
	if not bullet_scene:
		return
	var bullet = bullet_scene.instantiate()
	get_parent().add_child(bullet) 
	bullet.global_position = bullet_spawn.global_position
	bullet.rotation = bullet_spawn.global_position.direction_to(get_global_mouse_position()).angle()
	can_tortazo = false
	tortas_cooldown.start(.7)

func fire_lagrima():
	if not lagrimas_scene:
		return
	var lagrima = lagrimas_scene.instantiate()
	get_parent().add_child(lagrima) 
	lagrima.global_position = bullet_spawn.global_position
	lagrima.rotation = bullet_spawn.global_position.direction_to(get_global_mouse_position()).angle()
	can_lagrima = false
	lagrima_cooldown.start(.3)


func _on_dash_again_timer_timeout():
	can_dash = true


func _on_tortas_cooldown_timeout():
	can_tortazo = true


func _on_lagrima_cooldown_timeout():
	can_lagrima = true
