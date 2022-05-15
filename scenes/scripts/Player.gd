extends Node2D

var targets

func _ready():
	targets = $Targets.get_children()

func get_random_target():
	var index = randi() % targets.size()
	var target = targets[index]
	return target

var speed = 400
var angular_speed = PI

func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_left"):
		direction = -1
	if Input.is_action_pressed("ui_right"):
		direction = 1
	rotation += angular_speed * direction * delta
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.UP.rotated(rotation) * speed * -1
	position += velocity * delta
