extends RigidBody2D

var VELOCITY = Vector2(0, 300)
var DIRECTION = 1
enum ATTACKS {Sky_shot = 0, Rolling_ball = 1, Triple_shot = 2 }
@export var poem_scene : PackedScene

@onready var center_bullet = $CenterBullet
@onready var top_bullet = $TopBullet
@onready var bottom_bullet = $BottomBullet

var time_counter = 0
var attack_action: ATTACKS = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	gravity_scale = 0
	attack(attack_action)
	if DIRECTION:
		linear_velocity = VELOCITY
		if global_position.y > 600:
			DIRECTION = 0
	else: 
		linear_velocity = -VELOCITY
		if global_position.y < 0:
			DIRECTION = 1
	
	time_counter -= 1
	
	
func attack(attackType: ATTACKS):
	if attackType == 2:
		if time_counter <= 0:
			time_counter = 90
			tripleFire()
	if attackType == 1:
		if time_counter <= 0:
			time_counter = 60
			rollingFire()
	time_counter -= 1

func tripleFire():
	if not poem_scene:
		return
	else:
		var TopBullet = poem_scene.instantiate()
		var CenterBullet = poem_scene.instantiate()
		var BottomBullet = poem_scene.instantiate()
		get_parent().add_child(TopBullet)
		get_parent().add_child(CenterBullet)
		get_parent().add_child(BottomBullet)
		TopBullet.global_position = top_bullet.global_position
		CenterBullet.global_position = center_bullet.global_position
		BottomBullet.global_position = bottom_bullet.global_position
		TopBullet.rotation = -0.200
		BottomBullet.rotation = 0.200
		

func rollingFire():
	if not poem_scene:
		return
	else:
		var TopBullet = poem_scene.instantiate()
		var CenterBullet = poem_scene.instantiate()
		var BottomBullet = poem_scene.instantiate()
		get_parent().add_child(TopBullet)
		get_parent().add_child(CenterBullet)
		get_parent().add_child(BottomBullet)
		TopBullet.attackType = 0
		CenterBullet.attackType = 0
		BottomBullet.attackType = 0		
		TopBullet.global_position = top_bullet.global_position
		CenterBullet.global_position = center_bullet.global_position
		BottomBullet.global_position = bottom_bullet.global_position
		TopBullet.move_local_y(-20)
		BottomBullet.move_local_y(20)
		TopBullet.size_changer(Vector2(2,2))
		CenterBullet.size_changer(Vector2(2,2))
		BottomBullet.size_changer(Vector2(2,2))
		
