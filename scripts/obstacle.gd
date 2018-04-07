extends Reference

const Direction = preload("direction.gd")

func ready():
    assert(Direction.from_enum(Direction.EAST).get_rotation() == 0.0)

func draw(canvas, pos, scale):
    pass

func process(delta):
    pass
