extends Control

onready var textPanel = $TextureRect/MarginContainer/RichTextLabel
onready var player = $".."

const maxline = 64

func _ready():
	player.connect("next_dialog", self, "writeText")

func writeText(text: String):
	var full_txt = text
	if text.length() > maxline:
		var pos = 64
		while text[pos] != " " or pos >= 0:
			pos = pos - 1
			print(pos)
		if pos < 0:
			full_txt[pos] = "\n"
		else:
			full_txt = text.left(64) + "\n" + text.right(64)
		
	textPanel.text = full_txt

