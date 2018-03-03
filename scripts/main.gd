extends Control

var title = preload("res://scenes/title.tscn").instance()

var scenes = []

func _ready():
    next(title)

func back():
    scenes.remove(scenes.size()-1)
    self.call_deferred("remove_child", self.get_child(0))
    if(scenes.size() > 0):
        self.call_deferred("add_child", scenes[-1])
    else:
        get_tree().quit()

func next(tscn):
    scenes.append(tscn)
    if(0 < self.get_child_count()):
        self.remove_child(self.get_child(0))
    self.add_child(tscn)
