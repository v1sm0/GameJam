extends Area2D

var SPEED = 300
var attackType = 1  

func _physics_process(delta: float):
	if attackType == 1:
		position += transform.x * SPEED * delta 
	else:
		position.x += SPEED * delta
		
