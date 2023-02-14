extends Area2D

var puzz

func _ready():
	if (WorldFlags.solvedPuzzles&1):
		monitorable = false
		monitoring = false
		return
	puzz = load("res://Scenes/Puzzles/puzzle1.tscn").instance()
	puzz.connect("puzzle_complete",self,"puzzle_complete")
	puzz.connect("puzzle_canceled",self,"puzzle_canceled")

func use():
	$"/root/Ui".add_child(puzz)
	WorldFlags.paused=true

func puzzle_canceled():
	puzz.get_parent().remove_child(puzz)
	WorldFlags.paused=false
	
func puzzle_complete():
	get_parent().get_parent().get_node("door2").open()
	monitorable = false
	monitoring = false
