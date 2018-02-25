extends Control

const Cell = preload("cell.gd")

const WallObstacle = preload("wall_obstacle.gd")
const FloorObstacle = preload("floor_obstacle.gd")
const EvilMouseObstacle = preload("evil_mouse_obstacle.gd")
const GoodMouseObstacle = preload("good_mouse_obstacle.gd")

var cells = [
	[Cell.new(WallObstacle.new()), Cell.new(WallObstacle.new()), Cell.new(WallObstacle.new())],
	[Cell.new(WallObstacle.new()), Cell.new(FloorObstacle.new()), Cell.new(WallObstacle.new())],
	[Cell.new(WallObstacle.new()), Cell.new(WallObstacle.new()), Cell.new(WallObstacle.new())]
]

func _ready():
	set_process(true)
	set_process_input(true)

func _process(delta):
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

func _draw():
	draw_rect(Rect2(Vector2(0, 0), Vector2(256 * 64, 256 * 64)), Color(1, 0, 0))
	var width = get_width()
	var height = get_height()
	for column in get_width():
		for row in get_height():
			var cell = cells[column][row]
			draw_rect(Rect2(Vector2(column * 64, row * 64), Vector2(64, 64)), Color(1, 0, 0))
			cell.render(self, Vector2(column * 64, row * 64))

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				print("begin drag", event.position)
			else:
				print("end drag")
		if event.button_index == BUTTON_WHEEL_UP:
			print("Wheel up")

		if event.button_index == BUTTON_WHEEL_DOWN:
			print("Wheel down")
		print("Viewport Resolution is: ", get_viewport_rect().size)
			
	elif event is InputEventMouseMotion:
		pass
