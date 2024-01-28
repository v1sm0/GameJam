extends Node2D

@export var main_menu: PackedScene

@onready var margin_container = $MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	margin_container.position.y -= 1
	



