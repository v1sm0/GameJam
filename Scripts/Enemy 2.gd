extends CharacterBody2D

@export var speed = 100
var player_position
var target_position
@onready var player = $"../Player"
	
func _physics_process(delta):
	rotation_degrees+=1
	player_position = player.position
	target_position = (player_position - position).normalized()
	print(position.distance_to(player_position))
	rotation = (position.direction_to(player_position)).angle()
#	if position.distance_to(player_position) > 30:
#		velocity = position.direction_to(player.position) * speed
#		rotation = (position.direction_to(player_position)).angle()
#		look_at(player_position)
