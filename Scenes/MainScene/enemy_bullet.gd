extends Area2D

var speed = 800

func _physics_process(delta):
	position.x -= delta * speed
