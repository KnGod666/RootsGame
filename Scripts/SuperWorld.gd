extends Node

signal scene_changed

var music = {"Room1.tscn": load("res://Resources/Banda Sonora(Jhulian XD)/confusion y misterio.mp3"),
"Room3.tscn": load("res://Resources/Banda Sonora(Jhulian XD)/confusion y misterio.mp3"),
"Room4.tscn": load("res://Resources/Banda Sonora(Jhulian XD)/confusion y misterio.mp3"),
"Room2.tscn":load("res://Resources/Banda Sonora(Jhulian XD)/loop misterio.mp3"),
"Room7.tscn":load("res://Resources/Banda Sonora(Jhulian XD)/desaguaya.mp3"),
"Room5.tscn":load("res://Resources/Banda Sonora(Jhulian XD)/tension done.mp3")}
onready var musicP = $AudioStreamPlayer
onready var anim = $AnimationPlayer
onready var cur_room = $Room1
var next_room
var room_name = "Room1"
func _ready():
	emit_signal("scene_changed")
	cur_room.connect("change_scene",self,"change_scene")
	anim.play("fadeout")


func change_scene(arg):
	room_name = arg.substr(arg.length()-10)
	next_room = load(arg).instance()
	anim.play("fadein")
	musicP.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fadein":
		musicP.stream = music[room_name]
		musicP.play()
		cur_room.queue_free()
		cur_room=next_room
		add_child(cur_room)
		cur_room.connect("change_scene",self,"change_scene")
		emit_signal("scene_changed", cur_room)
		anim.play("fadeout")
