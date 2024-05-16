extends Area2D

var player = null


func _on_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		player.attackspeedboost()
		queue_free()
