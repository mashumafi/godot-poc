extends Node

var selected = null
var graphics = Canvas.new()
var generator = ObstacleGenerator.new()
onready var obstacle_list = $edit_panel/edit_box/obstacle_list
onready var preview = $edit_panel/edit_box/preview_box/preview
onready var maze = $maze

func _ready():
    $edit_panel/edit_box/width_box/width_sb.connect("value_changed", self, "width_sb_pressed")
    $edit_panel/edit_box/height_box/height_sb.connect("value_changed", self, "height_sb_pressed")

    maze.connect("cell_changed", self, "cell_changed")
    maze.set_width($edit_panel/edit_box/width_box/width_sb.value)
    maze.set_height($edit_panel/edit_box/height_box/height_sb.value)

    preview.connect("draw", self, "preview_draw")
    graphics.set_canvas(preview)

    for name in generator.names():
        obstacle_list.add_item(name)
    obstacle_list.connect("item_selected", self, "obstacle_selected")

func width_sb_pressed(value):
    maze.set_width(value)

func height_sb_pressed(value):
    maze.set_height(value)

func _notification(what):
    match what:
        MainLoop.NOTIFICATION_WM_QUIT_REQUEST, MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
            get_parent_control().back()

func obstacle_selected(index):
    if selected:
        var obstacle = generator.create(index)
        obstacle.set_position(selected.position())
        selected.set_obstacle(obstacle)
        maze.update()
        graphics.repaint()

func preview_draw():
    if selected:
        selected.get_obstacle().draw(graphics)

func cell_changed(cell):
    selected = cell
    if selected:
        graphics.set_translation(-selected.position())
        var obstacle = selected.get_obstacle()
        var names = generator.names()
        for i in range(names.size()):
            if obstacle.name() == names[i]:
                obstacle_list.select(i)
                break
    graphics.repaint()
