extends RigidBody2D

var VELOCITY = Vector2(0, 200)
var DIRECTION = 0
enum ATTACKS {Sky_shot = 0, Rolling_ball = 1, Triple_shot = 2 }

@export var poem1_scene : PackedScene
@export var poem2_scene : PackedScene
@export var poem3_scene : PackedScene
@export var poem4_scene : PackedScene

@export var ball1_scene : PackedScene
@export var ball2_scene : PackedScene
@export var ball3_scene : PackedScene
@export var ball4_scene : PackedScene

@onready var center_bullet = $CenterBullet
@onready var top_bullet = $TopBullet
@onready var bottom_bullet = $BottomBullet
@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree

@onready var icon = $Icon
@onready var icon_2 = $Icon2
@onready var icon_3 = $Icon3
@onready var icon_4 = $Icon4
@onready var icon_5 = $Icon5

var time_counter = 0
var attack_action: ATTACKS = 1
var attack_stop_time = 0
var last_direction
var action_timer = 0

var enemy_health = 1

func _ready():
	body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	gravity_scale = 0
	attack()
	if DIRECTION == 1:
		action_timer = 120
		icon_2.hide()
		icon_3.show()
		linear_velocity = VELOCITY
		animation_player.play("walk_down")
		if global_position.y > 600:
			DIRECTION = 0
			last_direction = 0
	elif DIRECTION == -1:
		action_timer = 60
		linear_velocity = Vector2(0,0)
		icon_2.hide()
		icon_3.hide()
		icon_5.show()
		animation_player.play("attack")
		attack_stop_time -=1
		if attack_stop_time <= 0:
			icon_5.hide()
			DIRECTION = last_direction
			linear_velocity = VELOCITY
	else: 
		action_timer = 120
		icon_2.show()
		icon_3.hide()
		animation_player.play("walk_up")
		linear_velocity = -VELOCITY
		if global_position.y < 0:
			DIRECTION = 1
			last_direction = 1
	
	time_counter -= 1
	
func attack():
	var Type = randi_range(0,1)
	if time_counter <= 0:
		attack_stop_time = 30
		if Type:
			time_counter = 210
			tripleFire()
			DIRECTION = -1
		else:
			time_counter = 160
			rollingFire()
			DIRECTION = -1
	time_counter -= 1

func tripleFire():
	if not poem1_scene:
		return
	else:
		var TopBullet = poem1_scene.instantiate()
		var CenterBullet = poem2_scene.instantiate()
		var BottomBullet = poem3_scene.instantiate()
		get_parent().add_child(TopBullet)
		get_parent().add_child(CenterBullet)
		get_parent().add_child(BottomBullet)
		TopBullet.global_position = top_bullet.global_position
		CenterBullet.global_position = center_bullet.global_position
		BottomBullet.global_position = bottom_bullet.global_position
		TopBullet.rotation = 0.200
		BottomBullet.rotation = -0.200
	

func rollingFire():
	if not poem1_scene:
		return
	else:
		var TopBullet = ball1_scene.instantiate()
		var CenterBullet = ball2_scene.instantiate()
		var BottomBullet = ball3_scene.instantiate()
		get_parent().add_child(TopBullet)
		get_parent().add_child(CenterBullet)
		get_parent().add_child(BottomBullet)
		TopBullet.animation_player.play('roll')
		CenterBullet.animation_player.play('roll')
		BottomBullet.animation_player.play('roll')
		TopBullet.attackType = 0
		CenterBullet.attackType = 0
		BottomBullet.attackType = 0
		TopBullet.global_position = top_bullet.global_position
		CenterBullet.global_position = center_bullet.global_position
		BottomBullet.global_position = bottom_bullet.global_position
		TopBullet.move_local_y(-50)
		BottomBullet.move_local_y(50)
		TopBullet.size_changer(Vector2(2,2))
		CenterBullet.size_changer(Vector2(2,2))
		BottomBullet.size_changer(Vector2(2,2))
		

func reacieve_damage():
	enemy_health -= 1
	if enemy_health <= 0:
		DIRECTION = -2
		VELOCITY = Vector2(0,0)
		icon.hide()
		icon_2.hide()
		icon_3.hide()
		icon_4.show()
		icon_5.hide()
		animation_player.play("dead")
		

func _on_body_entered(body):
	reacieve_damage()
