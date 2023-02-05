extends Sprite

onready var colision_area = $StaticBody2D3

func _ready():
	if(WorldFlags.OpenDoors&(1<<1)):
		position.y+=1200
	pass


func open():
	WorldFlags.OpenDoors|=(1<<1)
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", position+Vector2(0,1200), 1.0).set_trans(Tween.TRANS_SINE)
