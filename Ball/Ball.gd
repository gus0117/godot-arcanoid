extends RigidBody2D

var is_started : bool = false
var speed_x = 30
var speed_y = -200
var plus_speed = 75
var block_counter = 0 #Contador de bloques destruidos

#Audios
onready var break_a : AudioStreamPlayer2D = get_node("break_a")
onready var hit_a : AudioStreamPlayer2D = get_node("hit_a")
onready var lose_a : AudioStreamPlayer2D = get_node("lose_a")
onready var start_a : AudioStreamPlayer2D = get_node("start_a")
onready var win_a : AudioStreamPlayer2D = get_node("win_a")

func _input(event):
	if not is_started and event.is_action_pressed("ui_accept"):
		is_started = true
		start_a.play()
		linear_velocity = Vector2(speed_x, speed_y)

func _physics_process(delta):
	var collision_list = get_colliding_bodies()
	for body in collision_list:
		if body.is_in_group("gr_block"):
			body.queue_free()
			break_a.play()
			block_counter += 1
			if body.get_parent().get_child_count() == 1:
				print("you win")
				get_tree().paused = true
				win_a.play()
				yield(win_a, "finished")
				queue_free()
				var replay_scene = load("res://Title/Replay_title.tscn")
				get_parent().add_child(replay_scene.instance())
			if block_counter == 4:
				speed_x += plus_speed
				speed_y -= plus_speed
				linear_velocity = Vector2(speed_x, speed_y)
				block_counter = 0
		elif body.name == "bot_border":
			print("Lose")
			get_tree().paused = true
			lose_a.play()
			yield(lose_a, "finished")
			queue_free()
			var replay_scene = load("res://Title/Replay_title.tscn")
			get_parent().add_child(replay_scene.instance())
		else:
			hit_a.play()
