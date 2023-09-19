extends KinematicBody2D

export var speed : int = 4


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Player")
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_accept"):
		print("Action")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
