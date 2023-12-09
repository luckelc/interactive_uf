extends Node

# Define a signal that will be emitted when a child script sends a message
signal child_mouse_entered(value)
@onready var children = get_children()
@onready var player = get_node("../Player")
var nextScene

func _on_child_mouse_entered(value):
	for child in children:
		if(child.get_instance_id() == value):
			children.erase(child)
			instance_from_id(value).queue_free()
			player.set_player_goal(child.global_position)
			nextScene = child.nextScene
