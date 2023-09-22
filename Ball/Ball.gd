extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_started : bool = false
var speed_x = 100
var speed_y = -200
var plus_speed = 75
var block_counter = 0 #Contador de bloques destruidos

func _input(event):
	if not is_started and event.is_action_pressed("ui_accept"):
		is_started = true
		linear_velocity = Vector2(speed_x, speed_y)

func _physics_process(delta):
	var collision_list = get_colliding_bodies()
	for body in collision_list:
		if body.is_in_group("gr_block"):
			body.queue_free()
			block_counter += 1
			if block_counter == 4:
				speed_x += plus_speed
				speed_y += plus_speed
				linear_velocity = Vector2(speed_x, speed_y)
				block_counter = 0
