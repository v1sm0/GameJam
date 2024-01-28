extends VBoxContainer

@export var creditos: PackedScene
@export var nivel: PackedScene
@export var ajustes: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_jugar_pressed():
	get_tree().change_scene_to_packed(nivel)

func _on_ajustes_pressed():
	get_tree().change_scene_to_packed(ajustes)

func _on_créditos_pressed():
	get_tree().change_scene_to_packed(creditos)

func _on_salir_pressed():
	get_tree().quit()
