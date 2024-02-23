extends CharacterBody2D

const speed = 150
const accel = 7

@onready var nav: NavigationAgent2D = $NavigationAgent2D
var newDirection:Vector2 = Vector2()
var isMoving:bool = false

func set_player_goal(newPos:Vector2):
	nav.target_position = newPos
	isMoving = true;

func _physics_process(delta):
	if(isMoving):
		if(global_position.distance_to(nav.get_next_path_position()) < 3):
			isMoving = false
			get_tree().change_scene_to_packed(get_node("../StoreManager").nextScene)
		newDirection = nav.get_next_path_position() - global_position
		newDirection = newDirection .normalized()
		velocity = velocity.lerp(newDirection * speed, accel * delta)
		move_and_slide()
