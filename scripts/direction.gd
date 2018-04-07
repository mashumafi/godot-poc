enum Direction {EAST, NORTH, WEST, SOUTH}

class EastDirection:
    func get_rotation():
        return 0.0

class NorthDirection:
    func get_rotation():
        return 90.0

class WestDirection:
    func get_rotation():
        return 180.0

class SouthDirection:
    func get_rotation():
        return 270.0

var East = EastDirection.new()
var North = NorthDirection.new()
var West = WestDirection.new()
var South = SouthDirection.new()

func from_enum(direction):
    match direction:
        EAST: return East
        NORTH: return North
        WEST: return West
        SOUTH: return South
