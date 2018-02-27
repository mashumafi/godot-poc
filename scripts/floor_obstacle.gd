extends "res://scripts/obstacle.gd"

const regular32 = preload("res://fonts/regular32.tres")
const burlywood = Color("#DEB887")

func draw(canvas, pos):
	canvas.draw_rect(Rect2(Vector2(pos.x, pos.y), Vector2(64, 64)), burlywood)
	canvas.draw_string(regular32, Vector2(pos.x + 3, pos.y + regular32.get_size()), "Floor")
