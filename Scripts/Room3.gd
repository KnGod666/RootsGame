extends Node2D

signal change_scene

const spawnpoints = [Vector2(-3600,2730),Vector2(2900,2700)]


func _on_Room4_TP_area_entered(area):
	WorldFlags.entrance = 0
	emit_signal("change_scene","res://Scenes/Room4.tscn")


func _on_Room1_TP_area_entered(area):
	WorldFlags.entrance = 2
	emit_signal("change_scene","res://Scenes/Room1.tscn")
