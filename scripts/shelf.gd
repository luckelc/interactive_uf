extends Sprite2D

# Reference to the parent script
@onready var parent_script = get_parent()
@export var nextScene:PackedScene
@export var unique_id:int
var isReady:bool = true

func _ready():
	for id_visited in PlayerVariables.visited:
		if(unique_id == id_visited):
			print("YEEESSSS IM BOU TO " + name)
			isReady = false
			visible = false

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and parent_script.player.isMoving == false:
		if get_rect().has_point(to_local(event.position)) and isReady:
			print("You clicked on " + name)
			PlayerVariables.visited.append(unique_id)
			print(PlayerVariables.visited)
			parent_script.emit_signal("child_mouse_entered", get_instance_id())
