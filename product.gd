extends Area2D

@export var isWrong:bool = true

func _input_per(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("TEST")
		if isWrong:
			get_node("../../wrong_answer").visible = true
		else:
			get_node("../../right_answer").visible = true
