var obstacles = []

func _init(obstacle):
	if obstacle:
		obstacles.push_back(obstacle)

func draw(canvas, pos):
	for obstacle in obstacles:
		obstacle.draw(canvas, pos)
	draw_rect(canvas, pos.x, pos.y)

const line_width = 2

func draw_rect(canvas, x1, y1):
	var x2 = x1 + 64
	var y2 = y1 + 64
	var offset = line_width / 2.0

	canvas.draw_line(Vector2(x1, y1 + offset), Vector2(x2, y1 + offset), Color(1, 1, 1), line_width)
	canvas.draw_line(Vector2(x2 - offset, y1), Vector2(x2 - offset, y2), Color(1, 1, 1), line_width)
	canvas.draw_line(Vector2(x2, y2 - offset), Vector2(x1, y2 - offset), Color(1, 1, 1), line_width)
	canvas.draw_line(Vector2(x1 + offset, y2), Vector2(x1 + offset, y1), Color(1, 1, 1), line_width)

func process(delta):
	for obstacle in obstacles:
		obstacle.process(delta)
