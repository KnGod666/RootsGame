extends Node2D

signal change_scene

onready var tiles = $"Lab Tiles"

const spawnpoints = [Vector2(-1550, 6950)]
const bridges = [Vector2(-3,18),Vector2(4,18),
				Vector2(4,14),Vector2(4,18),
				Vector2(6,12),Vector2(11,12),
				Vector2(11,9),Vector2(11,12),
				Vector2(13,7),Vector2(15,7)]

func _ready():
	pass

func _on_Room4_TP_area_entered(area):
	WorldFlags.entrance = 1
	emit_signal("change_scene","res://Scenes/Rooms/Room4.tscn")

func drawBridge(num):
	var next_cell =(tiles.get_cell(bridges[num*2].x,bridges[num*2].y))%2+5
	print(next_cell)
	for x in range(bridges[num*2].x,bridges[num*2+1].x):
		tiles.set_cell(x,bridges[num*2].y,next_cell)
		tiles.set_cell(x,bridges[num*2].y+1,next_cell)
	for y in range(bridges[num*2].y,bridges[num*2+1].y):
		tiles.set_cell(bridges[num*2].x,y,next_cell)
		tiles.set_cell(bridges[num*2].x+1,y,next_cell)
	pass
