extends Control

var level = preload("res://scenes/level.tscn").instance()

const stages = [
    {"text":"STAGE_TUTORIAL","id":"tutorial"}
]
onready var stages_container = get_node("stage_scroll/stages_container")

func _ready():
    for stage in stages:
        var btn = Button.new()
        btn.text = stage.text
        btn.add_font_override("font", preload("res://fonts/regular32.tres"))
        btn.connect("pressed", self, "stage_btn_pressed", [stage.id])
        stages_container.add_child(btn)

    var back_btn = get_node("back_btn")
    back_btn.connect("pressed", self, "back_btn_pressed")

func stage_btn_pressed(which):
    get_parent_control().next(level)
    level.set_stage(which)

func back_btn_pressed():
    get_parent_control().back()

func _notification(what):
    match what:
        MainLoop.NOTIFICATION_WM_QUIT_REQUEST, MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
            get_parent_control().back()
