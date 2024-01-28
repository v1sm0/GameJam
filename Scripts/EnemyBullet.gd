extends Area2D
class_name Poem_bullet

var SPEED = -200
var attackType = 1
@onready var animation_player = $AnimationPlayer


func _ready():
	body_entered.connect(_on_body_entered)

func _physics_process(delta: float):
	if attackType == 1:
		SPEED = -150
		position += transform.x * SPEED * delta 
	else:
		position.x += SPEED * delta

func size_changer(new_size: Vector2):
	scale = new_size

func _on_body_entered(body: Node2D):
	body.takeDamage()
	queue_free()
