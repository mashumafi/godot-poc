extends Control

const WallObstacle = preload("wall_obstacle.gd")
const FloorObstacle = preload("floor_obstacle.gd")
const EvilMouseObstacle = preload("evil_mouse_obstacle.gd")
const GoodMouseObstacle = preload("good_mouse_obstacle.gd")

var cells

func _ready():
	set_process(true)
	cells = [
		[WallObstacle.new(), WallObstacle.new(), WallObstacle.new()],
		[WallObstacle.new(), FloorObstacle.new(), WallObstacle.new()],
		[WallObstacle.new(), WallObstacle.new(), WallObstacle.new()],
	]

func _process(delta):
	update()

func _draw():
	for column in cells.size():
		for row in cells[column].size():
			var cell = cells[column][row]
			draw_rect(Rect2(Vector2(column * 64, row * 64), Vector2(64, 64)), Color(1, 0, 0))
			_draw_rect(column * 64, row * 64)
			cell.render(self, Vector2(column * 64, row * 64))

const line_width = 2

func _draw_rect(x1, y1):
	var x2 = x1 + 64
	var y2 = y1 + 64
	var offset = line_width / 2.0

	draw_line(Vector2(x1, y1 + offset), Vector2(x2, y1 + offset), Color(1, 1, 1), line_width)
	draw_line(Vector2(x2 - offset, y1), Vector2(x2 - offset, y2), Color(1, 1, 1), line_width)
	draw_line(Vector2(x2, y2 - offset), Vector2(x1, y2 - offset), Color(1, 1, 1), line_width)
	draw_line(Vector2(x1 + offset, y2), Vector2(x1 + offset, y1), Color(1, 1, 1), line_width)
