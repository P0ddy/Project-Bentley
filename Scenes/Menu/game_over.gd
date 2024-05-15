extends Control


func _on_restart_pressed():
	AudioPlayer.button_click()
	AudioPlayer.BossFightMusicStop()
	AudioPlayer.InGameMusicStop()
	AudioPlayer.InGameMusicStart()
	
	get_tree().change_scene_to_file("res://Scenes/MainScene/Game.tscn")
	Global.score = 0
	Global.health = 3

func _on_quit_pressed():
	AudioPlayer.BossFightMusicStop()
	AudioPlayer.InGameMusicStop()
	AudioPlayer.MainThemeStart()
	AudioPlayer.button_click()
	get_tree().change_scene_to_file("res://Scenes/Menu/main_menu.tscn")
