extends MarginContainer

@onready var texto_creditos = $TextoCreditos


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	texto_creditos.position.y -= 1

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menus/MenuPrincipal.tscn")
