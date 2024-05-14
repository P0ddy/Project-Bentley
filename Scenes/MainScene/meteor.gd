extends CharacterBody2D

@export var minspeed = 50
@export var maxspeed = 250
@export var minRotationRate = -25
@export var maxRotationRate = 25

var health = 3
var player = null
var speed = 0
var RotationRate = 0


func _ready():
	speed = randf_range(minspeed, maxspeed)
	RotationRate = randf_range(minRotationRate, maxRotationRate)

func _physics_process(delta):
	rotation_degrees += RotationRate * delta
	
	position.y += speed * delta

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body

func enemy_hit():
	health -= 1
	if health == 0:
		Global.camera.screen_shake(4, 4, 0.05)
		Global.score += 3
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_damage_area_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit()
	
