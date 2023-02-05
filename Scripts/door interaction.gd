extends Area2D

signal send_dialog 

func use():
	if(ItemsDb.has_item("ID_Card")):
		get_parent().open()
	else:
		pass
