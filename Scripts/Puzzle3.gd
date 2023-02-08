extends Node2D

signal change_scene

const spawnpoints = [Vector2(-1550, 6950)]

func _ready():
	pass



func _on_Room4_TP_area_entered(area):
	WorldFlags.entrance = 1
	emit_signal("change_scene","res://Scenes/Room4.tscn")
