extends CharacterBody2D

const NAME = "Vel"

var Explosion = preload("res://Scenes/MainScene/explosion.tscn")

@export var minspeed = 225
@export var maxspeed = 350

var health = 2
var player = null
var speed = 0


func _ready():
	speed = randf_range(minspeed, maxspeed)

func _physics_process(delta):
	position.x -= speed * delta

func _on_detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body

func enemy_hit():
	health -= 1
	$Sprite2D.modulate = Color.DARK_RED
	await get_tree().create_timer(0.1).timeout
	$Sprite2D.modulate = Color.WHITE
	
	
	if health == 0:
		Global.camera.screen_shake(4, 4, 0.05)
		Global.score += 5
		queue_free()
		
	if health == 0:
		var explosion = Explosion.instantiate()
		explosion.global_position = global_position
		get_tree().current_scene.add_child(explosion)
		AudioPlayer.Explosion()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_damage_area_2d_body_entered(body):
	if body.has_method("player_hit"):
		body.player_hit()
	
