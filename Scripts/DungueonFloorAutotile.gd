extends Node2D

#plantearse la posibilidad de usar un tilemap proporcionado en otra zona para usar la misma clase
#con diferentes tilemaps
var room = preload("res://scenes/Dungueon_Room.tscn")

onready var tilemap = $AutoTile
onready var rooms = $Rooms

export var cuadrants = 10
export var min_room_size = 6
export var max_room_size = 12
export var cuadrant_size = 15

func _ready():
	if cuadrant_size < max_room_size:	cuadrant_size=max_room_size
	reset_tilemap()
	generate_rooms()
	generate_paths()
	tilemap.update_bitmask_region()
	randomize()
	
	pass # Replace with function body.

func generate_rooms():
	for y in range(cuadrants):
		for x in range(cuadrants):
			
			var size = Vector2(randi()%(max_room_size-min_room_size)+min_room_size,
							   randi()%(max_room_size-min_room_size)+min_room_size)
			var pos = Vector2(randi()%(cuadrant_size-size.x as int)+x*cuadrant_size,
							0+randi()%(cuadrant_size-size.y as int)+y*cuadrant_size)
			
			var rand_room = room.instance()
			rand_room.make_room(pos,size)
			rooms.add_child(rand_room)
			tile_room(rand_room)
			pass
	pass

func generate_paths():
	for y in range(cuadrants):
		for x in range(cuadrants-1):
			
			var room1 = rooms.get_child(x+y*cuadrants)
			var room2 = rooms.get_child(x+1+y*cuadrants)
			
			var point1 = Vector2(randi()%(room1.get_size().x as int-2)+room1.position.x+1,
								 randi()%(room1.get_size().y as int-2)+room1.position.y+1)
			var point2 = Vector2(randi()%(room2.get_size().x as int-2)+room2.position.x+1,
								 randi()%(room2.get_size().y as int-2)+room2.position.y+1)
			
			draw_path(point1,point2)
		
	for y in range(cuadrants-1):
		for x in range(cuadrants):
			
			var room1 = rooms.get_child(x+y*cuadrants)
			var room2 = rooms.get_child(x+(y+1)*cuadrants)
			
			var point1 = Vector2(randi()%(room1.get_size().x as int-2)+room1.position.x+1,
								 randi()%(room1.get_size().y as int-2)+room1.position.y+1)
			var point2 = Vector2(randi()%(room2.get_size().x as int-2)+room2.position.x+1,
								 randi()%(room2.get_size().y as int-2)+room2.position.y+1)
			
			draw_path(point1,point2)
	pass
func tile_room(t):
	for y in range(t.get_size().y):
		for x in range(t.get_size().x):
			tilemap.set_cell(t.position.x+x,t.position.y+y,2)
			pass
		pass
	pass
func reset_tilemap():
	tilemap.clear()
	pass

func draw_path(point1, point2):
	
	if (randi()&2==1):
		for x in range(point1.x,point2.x, sign(point2.x-point1.x)):
			tilemap.set_cell(x,point1.y,2)
			tilemap.set_cell(x,point1.y+1,2)
			#fill_suroundings(x,point1.y)
		
		for y in range(point1.y,point2.y, sign(point2.y-point1.y)):
			tilemap.set_cell(point2.x,y,2)
			tilemap.set_cell(point2.x-1,y,2)
			#fill_suroundings(point2.x,y)
	else:
		for y in range(point1.y,point2.y, sign(point2.y-point1.y)):
			tilemap.set_cell(point1.x,y,2)
			tilemap.set_cell(point1.x+1,y,2)
			#fill_suroundings(point1.x,y)
			
		for x in range(point1.x,point2.x, sign(point2.x-point1.x)):
			tilemap.set_cell(x,point2.y,2)
			tilemap.set_cell(x,point2.y-1,2)
			#fill_suroundings(x,point2.y)
		
		pass
	pass
func fill_suroundings(xp,yp):
	for y in range(yp-1,yp+2):
		for x in range(xp-1,xp+2):
			if tilemap.get_cell(x,y) == TileMap.INVALID_CELL:
				tilemap.set_cell(x,y,2)
				pass
			pass
	pass

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		for r in range(rooms.get_child_count()):
			rooms.get_child(r).queue_free()
		reset_tilemap()
		rooms = Node2D.new()
		add_child(rooms)
		reset_tilemap()
		generate_rooms()
		generate_paths()
		tilemap.update_bitmask_region()
