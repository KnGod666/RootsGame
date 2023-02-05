extends Panel

signal puzzle_canceled
signal puzzle_complete

onready var label2 = $Panel/Label2
onready var label3 = $Panel/Label3
onready var label4 = $Panel/Label4
onready var label5 = $Panel/Label5
onready var label6 = $Panel/Label6

var label
var positions = [7, 1, 0, 19, 0]
var answer = "ROOT"
var pointer = 0
var actual = "    "
var charmap = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var rng = RandomNumberGenerator.new()

func _ready():
	label = [label2, label3, label4, label5]
	label[pointer].add_color_override("font_color", Color(1, 1, 1))
	for i in 4:
		rng.randomize()
		positions[i] = rng.randf_range(0, 25)
		actual[i] = charmap[positions[i]]
		label[i].text = charmap[positions[i]]

func _unhandled_key_input(event):
	if event.is_action_released("ui_cancel"):
		emit_signal("puzzle_canceled")
		return
	
	if event.is_action_pressed("ui_accept") and actual == answer:
		WorldFlags.solvedPuzzles|=(1<<1)
		emit_signal("puzzle_complete")
		emit_signal("puzzle_canceled")
		label6.text = "OK"
		pass
	elif event.is_action_pressed("ui_accept") and actual != answer:
		label6.text = "BAD"
		pass
	
	if event.is_action_released("ui_up"):
		positions[pointer] = positions[pointer] + 1
		var aux = pointer
		while(aux < 4):
			if positions[aux] > 25:
				positions[aux] = 0
				positions[aux + 1] = positions[aux + 1] + 1
			aux = aux + 1
		assign_letter()
		pass

	if event.is_action_released("ui_left"):
		pointer = pointer - 1;
		if(pointer == -1):
			pointer = 3
		assign_colors()
		pass

	if event.is_action_released("ui_right"):
		pointer = pointer + 1;
		pointer = pointer % 4
		assign_colors()
		pass
	
func assign_colors():
	for i in 4:
		label[i].add_color_override("font_color", Color(0, 0, 0))
	label[pointer].add_color_override("font_color", Color(1, 1, 1))

func assign_letter():
	for i in 4:
		actual[i] = charmap[positions[i]]
		label[i].text = charmap[positions[i]]
