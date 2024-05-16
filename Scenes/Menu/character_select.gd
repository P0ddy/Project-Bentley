extends Node2D



func _ready():
	$SelectButton.grab_focus()



func _process(delta):
	match Global.PlayerSelect:
		0:
			get_node("PlayerSelect").play("Player1")
			get_node("Selected Car").text = "Standard Karre"
		1:
			get_node("PlayerSelect").play("Player2")
			get_node("Selected Car").text = "Ferrari"
		2:
			get_node("PlayerSelect").play("Player3")
			get_node("Selected Car").text = "Bus"
		

func _on_left_button_pressed():
	AudioPlayer.button_click()
	if Global.PlayerSelect > 0:
		Global.PlayerSelect -=1


func _on_right_button_pressed():
	AudioPlayer.button_click()
	if Global.PlayerSelect < 2:
		Global.PlayerSelect +=1



func _on_select_button_pressed():
	AudioPlayer.button_click()
	AudioPlayer.InGameMusicStart()
	AudioPlayer.CarSelectThemeStop()
	get_tree().change_scene_to_file("res://Scenes/MainScene/Game.tscn")
