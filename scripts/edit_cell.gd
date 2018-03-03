extends "res://scripts/cell.gd"

var hover = false
var selected = false
var dirty = false

func draw(canvas, pos, scale):
    .draw(canvas, pos, scale)
    var color = Color(0, 0, 0)
    if hover:
        color = Color(1, 1, 1)
    if selected:
        color = Color(0, 1, 1)
    highlight(canvas, pos.x, pos.y, scale, color)

const line_width = 2

func highlight(canvas, x1, y1, scale, color):
    var x2 = x1 + scale * 64
    var y2 = y1 + scale * 64
    var offset = line_width / 2.0

    canvas.draw_line(Vector2(x1, y1 + offset), Vector2(x2, y1 + offset), color, line_width)
    canvas.draw_line(Vector2(x2 - offset, y1), Vector2(x2 - offset, y2), color, line_width)
    canvas.draw_line(Vector2(x2, y2 - offset), Vector2(x1, y2 - offset), color, line_width)
    canvas.draw_line(Vector2(x1 + offset, y2), Vector2(x1 + offset, y1), color, line_width)

func process(delta):
    .process(delta)

func inputEventMouseButton(event, rect):
    if event.button_index == BUTTON_LEFT:
        var original = selected
        selected = rect.has_point(event.position)
        dirty = dirty || (original != selected)

func inputEventMouseMotion(event, rect):
    var original = hover
    hover = rect.has_point(event.position)
    dirty = dirty || (original != hover)
