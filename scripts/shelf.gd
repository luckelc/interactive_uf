extends Sprite2D

# Reference to the parent script
@onready var parent_script = get_parent()
@export var nextScene:PackedScene

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and parent_script.player.isMoving == false:
		if get_rect().has_point(to_local(event.position)):
			print("You clicked on " + name)
			parent_script.emit_signal("child_mouse_entered", get_instance_id())
