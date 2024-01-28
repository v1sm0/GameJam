extends CharacterBody2D

@export var speed = 100
var player_position
var target_position
@onready var player = $"../Player"
@onready var bala_1 = $"Bala 1"
@onready var bala_2 = $"Bala 2"
@onready var bala_3 = $"Bala 3"
@export var Bala: PackedScene 
var fire_time = 0 
@onready var animation_player = $Sprite2D/AnimationPlayer

func _ready():
	animation_player.play("pestaneo")
	

func _physics_process(delta):
	
	player_position = player.position
	target_position = (player_position - position).normalized()
	print(position.distance_to(player_position))
	rotation = (position.direction_to(player_position)).angle()
	if position.distance_to(player_position) > 30:
		velocity = position.direction_to(player.position) * speed
		rotation = (position.direction_to(player_position)).angle()
		look_at(player_position)
#
#	else : 
#		velocity = Vector2(0,0)
	if fire_time <= 0:
		fire_time = 90
		fire()
		
	fire_time -= 1
	move_and_slide()
	
func fire():
	if not Bala:
		return
	else:
		var TopBullet = Bala.instantiate()
		get_parent().add_child(TopBullet)
		TopBullet.global_position = bala_1.global_position
#		print( bala_1.global_position.direction_to(player.position))
#		TopBullet.look_at(player.position)
		TopBullet.rotation = (position.direction_to(player.position)).angle()
		
		var CentreBullet = Bala.instantiate()
		get_parent().add_child(CentreBullet)
		CentreBullet.global_position = bala_2.global_position
		CentreBullet.rotation = (position.direction_to(player.position)).angle()
		
		var BottomBullet = Bala.instantiate()
		get_parent().add_child(BottomBullet)
		BottomBullet.global_position = bala_3.global_position
		BottomBullet.rotation = (position.direction_to(player.position)).angle()

