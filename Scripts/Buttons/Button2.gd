extends Area2D

signal button_pressed

func use():
	emit_signal("button_pressed", 1)
	pass
	
