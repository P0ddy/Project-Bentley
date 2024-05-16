class_name MainMenu
extends Control


@export var main_game_packed_scene : PackedScene = null


func _ready():
	$StartButton.grab_focus()


func _on_start_button_pressed():
	AudioPlayer.button_click()
	AudioPlayer.MainThemeStop()
	AudioPlayer.CarSelectThemeStart()
	get_tree().change_scene_to_file("res://Scenes/Menu/character_select.tscn")
	Global.score = 0
	Global.health = 3
	


func _on_options_button_pressed():
	AudioPlayer.button_click()
	get_tree().change_scene_to_file("res://Scenes/Menu/options_menu.tscn")


func _on_quit_button_pressed():
	AudioPlayer.button_click()
	get_tree().quit()
	
	





