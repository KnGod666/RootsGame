extends Panel

signal puzzle_complete
signal puzzle_canceled

onready var label = $MarginContainer/Panel/AspectRatioContainer/HBoxContainer/VBoxContainer3/Answer
var inputstr = "" setget _set_inputstr

func _ready():
	pass # Replace with function body.

func _unhandled_key_input(event):
	if inputstr == "BAD":
		inputstr = ""
	if inputstr == "OK":
		emit_signal("puzzle_complete")
		pass
		
	if event.is_action_released("ui_accept"):
		evaluate_text()
	
	if event.is_action_released("ui_cancel"):
		if(inputstr == ""):
			emit_signal("puzzle_canceled")
		else:
			inputstr = inputstr.left(inputstr.length() - 1)
	elif event.is_action_released("greek_action") and inputstr.length() < 5:
		var s = OS.get_scancode_string( event.scancode )
		self.inputstr = self.inputstr + s
	label.text = inputstr

func evaluate_text():
	if inputstr == "VIII":
		inputstr = "OK"
		label.text = "OK"
		WorldFlags.solvedPuzzles|=(1)
		emit_signal("puzzle_complete")
		emit_signal("puzzle_canceled")
	else:
		inputstr = "BAD"
		label.text = "BAD"


func _set_inputstr( what ):
  inputstr = what
