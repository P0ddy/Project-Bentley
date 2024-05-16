class_name PauseMenu
extends Control


@onready var ui_panel = $CanvasLayer as CanvasLayer

func _ready():
	get_tree().paused = true
	$CanvasLayer/MarginContainer/VBoxContainer/ContinueButton.grab_focus()

func resume():
	get_tree().paused = false



func _on_continue_button_button_down():
	AudioPlayer.button_click()
	get_tree().paused = false
	queue_free()

func _on_main_menu_button_button_down():
	AudioPlayer.button_click()
	AudioPlayer.MainThemeStart()
	AudioPlayer.InGameMusicStop()
	AudioPlayer.BossFightMusicStop()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")



func _process(delta):
	return
	if Input.is_action_pressed("Pause"):
		get_tree().paused = false
		queue_free() 

#Fullscreen Toggle

func _on_check_button_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

	
