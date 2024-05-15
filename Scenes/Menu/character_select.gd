extends Node2D


func _process(delta):
	match Global.PlayerSelect:
		0:
			get_node("PlayerSelect").play("Player1")
		1:
			get_node("PlayerSelect").play("Player2")
		2:
			get_node("PlayerSelect").play("Player3")

func _on_left_button_pressed():
	if Global.PlayerSelect > 0:
		Global.PlayerSelect -=1


func _on_right_button_pressed():
	if Global.PlayerSelect < 2:
		Global.PlayerSelect +=1
