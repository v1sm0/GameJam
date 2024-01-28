extends Area2D

var speed = 300

func _ready():
	body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta

func _on_body_entered(body: Node2D):
	body.take_damage()
	queue_free()
	
func _on_timer_timeout():
	pass 
