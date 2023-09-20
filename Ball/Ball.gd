extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_started : bool = false

func _input(event):
	if not is_started and event.is_action_pressed("ui_accept"):
		is_started = true
		linear_velocity = Vector2(40, -200)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
