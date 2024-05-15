extends Area2D

var player = null
var health = 1

func _on_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		Global.health += 1
		AudioPlayer.HealthPickup()
		queue_free()

