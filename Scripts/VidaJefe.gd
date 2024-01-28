extends Control

@onready var purple_1 = $purple1
@onready var purple_2 = $purple2
@onready var purple_3 = $purple3
@onready var purple_4 = $purple4
@onready var purple_5 = $purple5
@onready var purple_6 = $purple6
@onready var purple_7 = $purple7
@onready var purple_8 = $purple8
@onready var purple_9 = $purple9
@onready var purple_10 = $purple10

func cambiar_vida(hp): 
	if hp <= 9: 
		purple_10.hide()
	if hp <= 8: 
		purple_9.hide()
	if hp <= 7: 
		purple_8.hide()
	if hp <= 6: 
		purple_7.hide()
	if hp <= 5:
		purple_6.hide()
	if hp <= 4:
		purple_5.hide()
	if hp <= 3:
		purple_4.hide()
	if hp <= 2:
		purple_3.hide()
	if hp <= 1:
		purple_2.hide()
	if hp <= 0:
		purple_1.hide()
