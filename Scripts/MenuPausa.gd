extends VBoxContainer

@export var menu_principal: PackedScene
@export var nivel: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_reiniciar_pressed():
	get_tree().change_scene_to_packed(nivel)


func _on_volver_menu_pressed():
	get_tree().change_scene_to_packed(menu_principal)


func _on_continuar_pressed():
	pass # Replace with function body.


func _on_salir_pressed():
	get_tree().quit()
