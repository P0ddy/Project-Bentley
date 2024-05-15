extends Node2D


func _process(delta):
	match Global.PlayerSelect:
		1:
			get_node("PlayerSelect").play("Player1")
		2:
			get_node("PlayerSelect").play("Player2")
		3:
			get_node("PlayerSelect").play("Player3")

func _on_left_button_pressed():
	if Global.PlayerSelect > 0:
		Global.PlayerSelect -=1


func _on_right_button_pressed():
	if Global.PlayerSelect < 3:
		Global.PlayerSelect +=1
