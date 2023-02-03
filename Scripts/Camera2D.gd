extends Node2D

var moveVector = Vector2(0,0)

func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if(event.is_action_pressed("ui_left")):
		moveVector.x = -1
	elif(event.is_action_pressed("ui_right")):
		moveVector.x = 1
	if(event.is_action_pressed("ui_up")):
		moveVector.y = -1
	elif(event.is_action_pressed("ui_down")):
		moveVector.y = 1
	
	if(event.is_action_released("ui_down")||event.is_action_released("ui_up")):
		moveVector.y = 0
	if(event.is_action_released("ui_left")||event.is_action_released("ui_right")):
		moveVector.x = 0

func _process(delta):
	position += (moveVector*200*delta)
