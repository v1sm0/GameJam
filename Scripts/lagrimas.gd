extends Area2D

var speed = 300


func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta


func _on_timer_timeout():
	pass 
