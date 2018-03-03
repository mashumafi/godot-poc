extends "res://scripts/maze.gd"

const EditCell = preload("edit_cell.gd")

func gencell():
    return EditCell.new()

func _ready():
    ._ready()
