extends Area2D

func _ready():
	if(WorldFlags.PickedUpItems&1):
		get_parent().queue_free()

func use():
	ItemsDb.add_item("ID_Card")
	WorldFlags.PickedUpItems|=1
	get_parent().queue_free()
	
