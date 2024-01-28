extends Control

@onready var red_1 = $red1
@onready var red_2 = $red2
@onready var red_3 = $red3
@onready var red_4 = $red4
@onready var red_5 = $red5


func cant_vida(hp): 
	if hp == 1: 
		red_2.hide()
		red_3.hide()
		red_4.hide()
		red_5.hide()
	elif hp == 2: 
		red_3.hide()
		red_4.hide()
		red_5.hide()
	elif hp == 3:
		red_4.hide()
		red_5.hide()
	elif hp == 4: 
		red_5.hide()
