extends Area2D

var player = null
var healt 


func _on_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		
		
		
