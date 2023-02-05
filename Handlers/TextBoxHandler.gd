extends Node

var textBox

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("/root/World").connect("scene_changed",self,"reload_item_box")
	pass

func write_text(text):
	textBox.writeText(text)

func showBox():
	textBox.show()
	WorldFlags.paused = true

func hideBox():
	textBox.hide()
	WorldFlags.paused = false

func reload_item_box(scene):
	textBox = scene.get_node("Ruth/DialogBox")
