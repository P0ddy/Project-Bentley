extends Area2D

var player = null
var score = 15

func _on_body_entered(body):
	if body.is_in_group("Player"):
		AudioPlayer.ScorePlus()
		player = body
		Global.score += 15
		queue_free()

