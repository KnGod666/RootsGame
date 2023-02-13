extends Node

signal next_dialog

onready var textBox = $TextBoxContainer/DialogBox

var dialog_chain = []

func _ready():
	connect("next_dialog",self,"write_text")
	pass

func _unhandled_input(event):
	if dialog_chain.size() > 0:
		if event.is_action_released("ui_accept"):
			dialog_chain.pop_front()
			if dialog_chain.size() > 0:
				emit_signal("next_dialog", dialog_chain[0])
			else:
				hideBox()
		return
func write_text(text):
	textBox.writeText(text)


func showBox():
	textBox.show()
	WorldFlags.paused = true


func hideBox():
	textBox.hide()
	WorldFlags.paused = false



func get_dialog(dialog):
	dialog_chain = dialog
	showBox()
	emit_signal("next_dialog", dialog_chain[0])
