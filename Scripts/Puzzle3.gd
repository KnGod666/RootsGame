extends Node2D

signal change_scene

#buttons
onready var button1 = $"interruptor/Interactive Area"
onready var button2 = $"interruptor2/Interactive Area"
onready var button3 = $"interruptor3/Interactive Area"
onready var button4 = $"interruptor4/Interactive Area"
onready var button5 = $"interruptor5/Interactive Area"
onready var button6 = $"interruptor6/Interactive Area"
onready var button7 = $"interruptor7/Interactive Area"
onready var button8 = $"interruptor8/Interactive Area"
onready var button9 = $"interruptor9/Interactive Area"

#bridges
onready var puente1 = $"Puente1"
onready var puente4 = $"Puente4"
onready var puente5 = $"Puente5"
onready var puente7 = $"Puente7"
onready var puente9 = $"Puente9"
onready var puente10 = $"Puente10"
onready var puente11 = $"Puente11"
onready var puente13 = $"Puente13"
onready var puente15 = $"Puente15"

#colliders
onready var collider1 = $"colliderPuente1"
onready var collider4 = $"colliderPuente4"
onready var collider5 = $"colliderPuente5"
onready var collider7 = $"colliderPuente7"
onready var collider9 = $"colliderPuente9"
onready var collider10 = $"colliderPuente10"
onready var collider11 = $"colliderPuente11"
onready var collider13 = $"colliderPuente13"
onready var collider15 = $"colliderPuente15"

const spawnpoints = [Vector2(-1550, 6950)]

var bridges = [] # [Node2D, ...]
var colliders = [] # [colision, ...]
var connections = [] # [[colision_number, colision_number], ...]
var three_element_max = []

func _ready():
	bridges = [
		puente1, puente4, puente5, puente7, puente9, puente10, puente11, puente13, puente15
	]
	colliders = [
		collider1, collider4, collider5, collider7, collider9, collider10, collider11, collider13, collider15
	]
	for i in bridges.size():
		bridges[i].hide()
	button1.connect("button_pressed", self, "manage_bridges")
	button2.connect("button_pressed", self, "manage_bridges")
	button3.connect("button_pressed", self, "manage_bridges")
	button4.connect("button_pressed", self, "manage_bridges")
	button5.connect("button_pressed", self, "manage_bridges")
	button6.connect("button_pressed", self, "manage_bridges")
	button7.connect("button_pressed", self, "manage_bridges")
	button8.connect("button_pressed", self, "manage_bridges")
	button9.connect("button_pressed", self, "manage_bridges")
	
func manage_colliders(collider, value):
	var static2d_list = collider.get_children()
	for it in static2d_list:
		for it2 in it.get_children():
			it2.disabled = value
		

func manage_bridges(enable: int):
	if not three_element_max.count(enable):
		three_element_max.push_back(enable)
	if three_element_max.size() > 3:
		three_element_max.pop_front()
	for i in bridges.size():
		bridges[i].hide()
		manage_colliders(colliders[i], false)
	for i in three_element_max.size():
		bridges[three_element_max[i]].show()
		manage_colliders(colliders[three_element_max[i]], true)
	pass


func _on_Room4_TP_area_entered(area):
	WorldFlags.entrance = 1
	emit_signal("change_scene","res://Scenes/Room4.tscn")
