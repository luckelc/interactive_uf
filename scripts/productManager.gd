extends Node2D


func _ready():
	get_node("../wrong_answer").visible = false
	get_node("../right_answer").visible = false

func _go_back():
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn");
