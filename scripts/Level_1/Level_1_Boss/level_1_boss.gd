extends Node

@onready var lvl_1_boss_quiz = $lvl_1_boss_quiz
@export var audio: AudioStream

func _enter_tree():
	if Checkpoint.last_position:
		$Player.global_position = Checkpoint.last_position


func _ready():
	if Music.check_music() != audio:
		Music.play_background(audio)
	if Progress.level >= 1:
		lvl_1_boss_quiz.queue_free()
	#code for finding door:
	if Global.door_name:
		var door_node = find_child(Global.door_name)
		if door_node:
			$Player.global_position = door_node.global_position

