extends Node2D


const spawnpoints = [Vector2(0,0)]

func _on_Area2D_area_entered(area):
	WorldFlags.entrance = 1
	get_tree().change_scene("res://Scenes/Room1.tscn")
