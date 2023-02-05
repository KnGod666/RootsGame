extends Control

onready var textPanel = $TextureRect/MarginContainer/RichTextLabel

func writeText(text):
	textPanel.text = text

