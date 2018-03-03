extends Node

const Maze = preload("play_maze.gd")

func _ready():
    var maze = Maze.new()

func set_level(stage_name, level_name):
    print("%s %s" % [stage_name, level_name])

func _notification(what):
    match what:
        MainLoop.NOTIFICATION_WM_QUIT_REQUEST, MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
            get_parent_control().back()
