extends CharacterBody2D


const speed = 300
const accel = 7

@onready var nav: NavigationAgent2D = $NavigationAgent2D

func _physics_process(delta):
	var newDirection = Vector3()
	nav.target_position = get_global_mouse_position()
	newDirection = nav.get_next_path_position() - global_position
	newDirection = newDirection .normalized()
	
	velocity = velocity.lerp(newDirection * speed, accel * delta)
	move_and_slide()
