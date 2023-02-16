extends Area2D

var puzz
onready var room = get_parent().get_parent().get_parent().get_parent()

func _ready():
	puzz = load("res://Scenes/Puzzles/Puzzle3.tscn").instance()
	puzz.connect("puzzle_canceled",self,"puzzle_canceled")
	puzz.connect("button_1_pressed",self,"b1d")
	puzz.connect("button_2_pressed",self,"b2d")
	puzz.connect("button_3_pressed",self,"b3d")
	puzz.connect("button_4_pressed",self,"b4d")

func use():
	$"/root/Ui".add_child(puzz)
	WorldFlags.paused=true

func puzzle_canceled():
	puzz.get_parent().remove_child(puzz)
	WorldFlags.paused=false

func b1d():
	room.drawBridge(0)
	pass

func b2d():
	room.drawBridge(1)
	pass

func b3d():
	room.drawBridge(2)
	pass

func b4d():
	room.drawBridge(3)
	room.drawBridge(4)
	pass
