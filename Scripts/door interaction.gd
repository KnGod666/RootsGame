extends Area2D


func use():
	if(ItemsDb.has_item("ID_Card")):
		get_parent().open()
	else:
		#mandar un mensaje de q no se puede
		pass
