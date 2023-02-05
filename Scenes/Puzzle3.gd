extends Node2D
onready var plants = $"Node2D/Lab Tiles"

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


const spawnpoints = [Vector2(-583, 4999)]

var bridges = [] # [Node2D, ...]
var colisions = [] # [colision, ...]
var connections = [] # [[colision_number, colision_number], ...]
var three_element_max = []

func _ready():
	bridges = [
		puente1, puente4, puente5, puente7, puente9, puente10, puente11, puente13, puente15
	]
	for i in bridges.size():
		bridges[i].hide()
	var button = get_node("items/ID Card/Interactive Area")
	#button.connect("button_pressed", self, "manage_bridges")


func manage_bridges(enable: int):
	three_element_max.push_back(enable)
	if three_element_max.size() > 3:
		three_element_max.pop_front()
	for i in bridges.size():
		bridges[i].hide()
	for i in three_element_max.size():
		bridges[three_element_max[i]].show()
	pass
