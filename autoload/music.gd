extends Node

@onready var background = $background


# Plays background music for each scene
func play_background(audio):
	background.stream = audio
	background.play()

# Used to check if audio stream changed when scene changed/reloaded
func check_music():
	return background.stream
	


