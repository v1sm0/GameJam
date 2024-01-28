extends MarginContainer

@export var menu_principal: PackedScene
@onready var reiniciar = $PanelContainer/MarginContainer/VBoxContainer/Reiniciar
@onready var volver_menu = $PanelContainer/MarginContainer/VBoxContainer/VolverMenu
@onready var salir = $PanelContainer/MarginContainer/VBoxContainer/Salir
@onready var continuar = $PanelContainer/MarginContainer/VBoxContainer/Continuar

func _ready():
	reiniciar.pressed.connect(_on_reiniciar_pressed)
	volver_menu.pressed.connect(_on_volver_menu_pressed)
	salir.pressed.connect(_on_salir_pressed)
	continuar.pressed.connect(_on_continuar_pressed)
	hide()

func _input(event):
	if event.is_action_pressed("PAUSA"):
		visible = !visible
		get_tree().paused = visible

func _on_reiniciar_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_volver_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_packed(menu_principal)

func _on_continuar_pressed():
	hide()
	get_tree().paused = visible

func _on_salir_pressed():
	get_tree().quit()
