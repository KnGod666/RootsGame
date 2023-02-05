extends Node2D

signal change_scene

const spawnpoints = [Vector2(-3650,2800),Vector2(1900,-2600),Vector2(1900,4200)]


#func _on_Room1_TP_area_entered(area):
#	WorldFlags.entrance = 2
#	emit_signal("change_scene","res://Scenes/Room1.tscn")


func _on_Room3_TP_area_entered(area):
	WorldFlags.entrance = 1
	emit_signal("change_scene","res://Scenes/Room3.tscn")


func _on_Room7_TP_area_entered(area):
	WorldFlags.entrance = 0
	emit_signal("change_scene","res://Scenes/Room7.tscn")
