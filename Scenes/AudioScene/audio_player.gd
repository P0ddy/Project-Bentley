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
