extends Node2D
onready var plants = $"Node2D/Lab Tiles"

const spawnpoints = [Vector2(1950,1360)]

var bridges = [] # [Node2D, ...]
var colisions = [] # [colision, ...]
var connections = [] # [[colision_number, colision_number], ...]

func _ready():
	var button = get_node("items/ID Card/Interactive Area")
	button.connect("button_pressed", self, "manage_bridges")

func manage_bridges(enable: Array, disable: Array):
	# enable give us an array of bridges (and conections) indexes
	# disable too
	enable_bridges(enable)
	disable_bridges(disable)

func enable_bridges(enable: Array):
	for i in enable.size():
		bridges[i].show()
		colisions[connections[i][0]].disabled = true;
		colisions[connections[i][1]].disabled = true;
	pass

func disable_bridges(disable: Array):
	for i in disable.size():
		bridges[i].hide()
		colisions[connections[i][0]].disabled = false;
		colisions[connections[i][1]].disabled = false;
	pass
