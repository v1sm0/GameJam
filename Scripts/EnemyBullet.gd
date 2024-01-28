extends Area2D

var SPEED = 150
var attackType = 1

func _ready():
	body_entered.connect(_on_body_entered)

func _physics_process(delta: float):
	if attackType == 1:
		SPEED = 300
		position += transform.x * SPEED * delta 
	else:
		position.x += SPEED * delta

func size_changer(new_size: Vector2):
	scale = new_size

func _on_body_entered(body: Node2D):
	if body.mask_layer == 1:
		body.takeDamage()
	pass
