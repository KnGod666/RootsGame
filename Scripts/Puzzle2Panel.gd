extends Area2D

var puzz

func _ready():
	if (WorldFlags.solvedPuzzles&(1<<1)):
		monitorable = false
		monitoring = false
		return
	puzz = load("res://Scenes/puzzle2.tscn").instance()
	puzz.connect("puzzle_canceled",get_parent().get_parent().get_parent().get_parent().get_node("Ruth"),"reselect_camera")
	puzz.connect("puzzle_complete",self,"puzzle_complete")
	puzz.connect("puzzle_canceled",self,"puzzle_canceled")

func use():
	get_tree().get_root().add_child(puzz)
	get_tree().get_root().get_node("World/ViewportCamera").current=true
	WorldFlags.paused=true

func puzzle_canceled():
	puzz.get_parent().remove_child(puzz)
	WorldFlags.paused=false
	
func puzzle_complete():
	monitorable = false
	monitoring = false
