extends Node2D

signal change_scene

const spawnpoints = [Vector2(1900,-1600)]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Room4_TP_area_entered(area):
	WorldFlags.entrance = 2
	emit_signal("change_scene","res://Scenes/Rooms/Room4.tscn")


func _on_Ending_TP_area_entered(area):
	var ap = get_tree().get_root().get_node("World/AnimationPlayer")
	ap.connect("animation_finished",self,"end")
	ap.play("fadein")

func end(kk):
	get_tree().quit()
