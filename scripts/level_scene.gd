extends Control

var play = preload("res://scenes/play.tscn").instance()
onready var levels_container = get_node("level_scroll/levels_container")

const stages = {
	"tutorial": [
		{"text":"LEVEL_MOVING","id":"moving"}
	]
}
var stage

func _ready():
	var back_btn = get_node("back_btn")
	back_btn.connect("pressed", self, "back_btn_pressed")

func set_stage(stage_name):
	stage = stage_name
	
	for child in levels_container.get_children():
		levels_container.remove_child(child)
	
	for level in stages[stage_name]:
		var btn = Button.new()
		btn.text = level.text
		btn.add_font_override("font", preload("res://fonts/regular32.tres"))
		btn.connect("pressed", self, "level_btn_pressed", [level.id])
		levels_container.add_child(btn)

func level_btn_pressed(which):
	play.set_level(stage, which)
	get_parent_control().next(play)

func back_btn_pressed():
	get_parent_control().back()

func _notification(what):
	match what:
		MainLoop.NOTIFICATION_WM_QUIT_REQUEST, MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
			get_parent_control().back()
