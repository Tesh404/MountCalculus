extends Node

@export var audio: AudioStream

func _ready():
	if Music.check_music() != audio:
		Music.play_background(audio)
