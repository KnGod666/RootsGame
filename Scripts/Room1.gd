extends Node2D

signal change_scene

const spawnpoints = [Vector2(-500,-1600),Vector2(-3700,2700),Vector2(2890,2650)]

func _on_Room2_TP_area_entered(area):
	WorldFlags.entrance = 0
	emit_signal("change_scene","res://Scenes/Room2.tscn")


func _on_Room3_TP_area_entered(area):
	WorldFlags.entrance = 0
	emit_signal("change_scene","res://Scenes/Room3.tscn")
