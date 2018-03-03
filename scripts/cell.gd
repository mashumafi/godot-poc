var obstacles = []

func draw(canvas, pos, scale):
    for obstacle in obstacles:
        obstacle.draw(canvas, pos, scale)

func process(delta):
    for obstacle in obstacles:
        obstacle.process(delta)

func inputEventMouseButton(event, rect):
    pass

func inputEventMouseMotion(event, rect):
    pass
    