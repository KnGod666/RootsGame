extends Node2D
onready var plants = $"Node2D/Lab Tiles"

const spawnpoints = [Vector2(1950,1360)]

var bridges = []
var colisions = []
var connections = []

func _ready():
	var button = get_node("items/ID Card/Interactive Area")
	button.connect("button_pressed", self, "manage_bridges")

func manage_bridges(enable, disable):
	plants.hide()
	enable_bridges(enable)

func enable_bridges(enable):
	pass

func disable_bridges(disable):
	pass
