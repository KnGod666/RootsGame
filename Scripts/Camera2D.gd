extends Node2D


#pa cambiar de escena
#get_tree().change_scene("res://Scenes/puzzle1.tscn")
#
#pa instanciar
#var puz1 = load("res://Scenes/puzzle1.tscn")
#var puz = puz1.instance()
#add_child(puz)  puedes anadirla a cualquier nodo que te de la gana

onready var sprite = $Sprite
onready var anim = $Sprite/AnimationPlayer
onready var popup = $Popup
var moveVector = Vector2(0,0)
func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	if(event.is_action_pressed("ui_left")):
		moveVector.x = -1
		sprite.flip_h = 1
	elif(event.is_action_pressed("ui_right")):
		moveVector.x = 1
		sprite.flip_h = 0 
	if(event.is_action_pressed("ui_up")):
		moveVector.y = -1
	elif(event.is_action_pressed("ui_down")):
		moveVector.y = 1
	
	anim.play("Walk")
	
	if(event.is_action_released("ui_down")&&moveVector.y==1)||(event.is_action_released("ui_up")&&moveVector.y==-1):
		moveVector.y = 0
	if(event.is_action_released("ui_left")&&moveVector.x==-1)||(event.is_action_released("ui_right")&&moveVector.x==1):
		moveVector.x = 0
	
	if(moveVector == Vector2.ZERO): anim.play("Still")

func _process(delta): 
	position += (moveVector*200*delta)


func _on_Area2D_area_entered(area):
	popup.show()
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	popup.hide()
	pass # Replace with function body.
