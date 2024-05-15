extends Node2D

func button_click():
	$"ButtonClick".play()

func Explosion():
	$Explosion.play()

func HealthPickup():
	$HealthPickup.play()

func MainThemeStart():
	$MainTheme.play()

func MainThemeStop():
	$MainTheme.stop()
	
func CarSelectThemeStart():
	$CarSelectTheme.play()
	
func CarSelectThemeStop():
	$CarSelectTheme.stop()
	
func InGameMusicStart():
	$InGame.play()

func InGameMusicStop():
	$InGame.stop()

func BossFightMusicStart():
	$BossFight.play()
	
func BossFightMusicStop():
	$BossFight.stop()
