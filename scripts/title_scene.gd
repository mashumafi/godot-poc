extends Control

var stage = preload("res://scenes/stage.tscn").instance()
var edit = preload("res://scenes/edit.tscn").instance()

func _ready():
	var stage_btn = get_node("action_container/stage_btn")
	stage_btn.connect("pressed", self, "stage_btn_pressed")

	var edit_btn = get_node("action_container/edit_btn")
	edit_btn.connect("pressed", self, "edit_btn_pressed")

	var quit_btn = get_node("quit_btn")
	quit_btn.connect("pressed", self, "quit_btn_pressed")

func stage_btn_pressed():
	get_parent_control().next(stage)

func edit_btn_pressed():
	get_parent_control().next(edit)

func quit_btn_pressed():
	get_parent_control().back()

func _notification(what):
	match what:
		MainLoop.NOTIFICATION_WM_QUIT_REQUEST, MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
			get_parent_control().back()
