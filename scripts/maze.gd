extends Control

const Cell = preload("cell.gd")

const WallObstacle = preload("wall_obstacle.gd")
const FloorObstacle = preload("floor_obstacle.gd")
const EvilMouseObstacle = preload("evil_mouse_obstacle.gd")
const GoodMouseObstacle = preload("good_mouse_obstacle.gd")

var position = Vector2(0, 0)
var dirty = true

var cells = [
	[Cell.new(WallObstacle.new()), Cell.new(WallObstacle.new()), Cell.new(WallObstacle.new())],
	[Cell.new(WallObstacle.new()), Cell.new(FloorObstacle.new()), Cell.new(WallObstacle.new())],
	[Cell.new(WallObstacle.new()), Cell.new(WallObstacle.new()), Cell.new(WallObstacle.new())]
]

func _ready():
	set_process(true)
	set_process_input(true)

func _process(delta):
	for column in get_width():
		for row in get_height():
			var cell = cells[column][row]
			cell.process(delta)
	if dirty:
		update()

func get_width():
	return cells.size()

func get_height():
	return cells[0].size()

func set_width(width):
	cells.resize(width)
	for column in get_width():
		if cells[column] == null:
			cells[column] = []
		cells[column].resize(get_height())
		for row in get_height():
			if cells[column][row] == null:
				cells[column][row] = Cell.new(null)
	self._setup_neighbors()

func set_height(height):
	for column in get_width():
		if cells[column] == null:
			cells[column] = []
		cells[column].resize(height)
		for row in get_height():
			if cells[column][row] == null:
				cells[column][row] = Cell.new(null)
	self._setup_neighbors()

func _setup_neighbors():
	print("%d %d" % [get_width(), get_height()])
	for column in get_width():
		for row in get_height():
			var cell = cells[column][row]
	dirty = true

func _draw():
	var size = get_global_rect().size
	
	var startX = max(floor(-position.x / 64), 0)
	var endX = max(min(min(startX + ceil(size.x / 64) + 1, get_width()), ceil((size.x - position.x) / 64)), 0)

	var startY = max(floor(-position.y / 64), 0)
	var endY = max(min(min(startY + ceil(size.y / 64) + 1, get_height()), ceil((size.y - position.y) / 64)), 0)

	var count = 0
	for column in range(startX, endX):
		for row in range(startY, endY):
			var cell = cells[column][row]
			cell.draw(self, Vector2(position.x + column * 64, position.y + row * 64))
			count+=1
	print("drew", count)
	dirty = false

var lastPos

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed and get_rect().has_point(event.position):
				lastPos = event.position
			else:
				lastPos = null

		if event.button_index == BUTTON_WHEEL_UP and get_rect().has_point(event.position):
			print("Wheel up")

		if event.button_index == BUTTON_WHEEL_DOWN and get_rect().has_point(event.position):
			print("Wheel down")

	elif event is InputEventMouseMotion:
		if lastPos:
			position += event.position - lastPos
			lastPos = event.position
			dirty = true
