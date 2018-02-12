extends Node

const Maze = preload("edit_maze.gd")

func _ready():
	pass

func _notification(what):
	match what:
		MainLoop.NOTIFICATION_WM_QUIT_REQUEST, MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
			get_parent_control().back()
