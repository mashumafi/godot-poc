extends "res://scripts/moving_obstacle.gd"

const regular32 = preload("res://fonts/regular32.tres")
const saddlebrown = Color("#8B4513")

func draw(canvas, pos, scale):
    canvas.draw_rect(Rect2(Vector2(pos.x, pos.y), Vector2(64, 64)), saddlebrown)
    canvas.draw_string(regular32, Vector2(pos.x + 3, pos.y + regular32.get_size()), "Mouse")
