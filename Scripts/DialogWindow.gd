extends Control

onready var textPanel = $TextureRect/MarginContainer/RichTextLabel

func _ready():
	pass

func writeText(text: String):
	textPanel.text = text

