extends Area2D

export(Texture) var texture
export var width = 1
export var height = 1
onready var sprite = $Sprite
onready var colision = $CollisionShape2D


func _ready():
	sprite.texture=texture
	colision.scale.x = width
	colision.scale.y = height
