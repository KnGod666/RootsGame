extends Control

onready var textPanel = $TextureRect/MarginContainer/RichTextLabel

const maxline = 20

func _ready():
	pass

func writeText(text: String):
	var full_txt = text
	if text.length() > maxline:
		var pos = 20
		while text[pos] != " " or pos >= 0:
			pos = pos - 1
		if pos < 0:
			full_txt[pos] = "\n"
		else:
			full_txt = text.left(64) + "\n" + text.right(64)
		
	textPanel.text = full_txt

