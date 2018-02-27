extends Node

const Maze = preload("edit_maze.gd")

func _ready():
	$edit_panel/edit_box/width_box/width_sb.connect("value_changed", self, "width_sb_pressed")
	$edit_panel/edit_box/height_box/height_sb.connect("value_changed", self, "height_sb_pressed")

func width_sb_pressed(value):
	$maze.set_width(value)

func height_sb_pressed(value):
	$maze.set_height(value)

func _notification(what):
	match what:
		MainLoop.NOTIFICATION_WM_QUIT_REQUEST, MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
			get_parent_control().back()
