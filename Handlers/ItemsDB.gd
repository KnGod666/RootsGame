extends Node

var items = {}
var inventory = {}

func _ready():
	var directory = Directory.new()
	directory.open("res://Items/")
	add_items(directory)

func add_items(directory):
	#breakpoint
	directory.list_dir_begin()
	var file = directory.get_next()
	file = directory.get_next()
	file = directory.get_next()
	while file:
		if(directory.current_is_dir()): 
			var dir = Directory.new()
			dir.open(file)
			add_items(dir)
			file = directory.get_next()
			continue
		var item = load("res://Items/%s" % file)
		items[item.name] = item
		file = directory.get_next()
	
	pass

func add_item(item):
	inventory[item] = true

func remove_item(item):
	inventory[item] = false

func get_item_texture(item):
	return items[item].texture

func has_item(item):
	return true if inventory[item] else false
