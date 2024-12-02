extends Node


@export var audio: AudioStream
# Called when the node enters the scene tree for the first time.
func _ready():
	if Music.check_music() != audio:
		Music.play_background(audio)
