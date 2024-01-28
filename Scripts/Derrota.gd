extends Node2D

@onready var button = $Button

# Called when the node enters the scene tree for the first time.
func _ready():
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed(): 
	get_tree().change_scene_to_file("res://Scenes/NivelFinal.tscn")

