extends Node2D

const spawnpoints = [Vector2(-500,-1600),Vector2(-3700,2700)]

func _on_Room2_TP_area_entered(area):
	WorldFlags.entrance = 0
	get_tree().change_scene("res://Scenes/Room2.tscn")
