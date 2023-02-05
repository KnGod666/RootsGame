extends Node

signal scene_changed

onready var anim = $AnimationPlayer
onready var cur_room = $Room1
var next_room

func _ready():
	cur_room.connect("change_scene",self,"change_scene")
	anim.play("fadeout")


func change_scene(arg):
	next_room = load(arg).instance()
	anim.play("fadein")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fadein":
		cur_room.queue_free()
		cur_room=next_room
		add_child(cur_room)
		cur_room.connect("change_scene",self,"change_scene")
		emit_signal("scene_changed", cur_room)
		anim.play("fadeout")
