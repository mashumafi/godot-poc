extends Node

const Maze = preload("edit_maze.gd")
var selected = null
var g = Canvas.new()
var generator = ObstacleGenerator.new()

func _ready():
    $edit_panel/edit_box/width_box/width_sb.connect("value_changed", self, "width_sb_pressed")
    $edit_panel/edit_box/height_box/height_sb.connect("value_changed", self, "height_sb_pressed")

    $maze.connect("cell_changed", self, "cell_changed")
    $maze.set_width($edit_panel/edit_box/width_box/width_sb.value)
    $maze.set_height($edit_panel/edit_box/height_box/height_sb.value)

    var preview = $edit_panel/edit_box/preview_box/preview
    preview.connect('draw', self, 'preview_draw')
    g.set_canvas(preview)

    for name in generator.names():
        $edit_panel/edit_box/obstacle_list.add_item(name)

func width_sb_pressed(value):
    $maze.set_width(value)

func height_sb_pressed(value):
    $maze.set_height(value)

func _notification(what):
    match what:
        MainLoop.NOTIFICATION_WM_QUIT_REQUEST, MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
            get_parent_control().back()

func preview_draw():
    if selected:
        g.draw_o_wall(Vector2(10, 10))

func cell_changed(cell):
    selected = cell
    $edit_panel/edit_box/preview_box/preview.update()
