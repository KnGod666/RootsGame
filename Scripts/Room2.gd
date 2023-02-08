extends Node2D

signal change_scene

const spawnpoints = [Vector2(-290,-400)]

func _on_Area2D_area_entered(area):
	WorldFlags.entrance = 1
	emit_signal("change_scene","res://Scenes/Rooms/Room1.tscn")
