extends Node

@export var audio: AudioStream
# Upon changing scene or restarting scene, checks if Global variable Checkpoint
# last_position is null. If not null, then re-spawns player at last checkpoint.
func _enter_tree():
	if Checkpoint.last_position:
		$Player.global_position = Checkpoint.last_position


func _ready():
	Global.register_scene(get_tree().current_scene.scene_file_path)
	if Music.check_music() != audio:
		Music.play_background(audio)
	
	# Code for finding door:
	# Example: When changing scene to another level, checks if the subsequent 
	# level has a portal/door with the same name, if yes, then spawn player at 
	# that position.
	if Global.door_name:
		var door_node = find_child(Global.door_name)
		if door_node:
			$Player.global_position = door_node.global_position
		if Checkpoint.last_position:
			$Player.global_position = Checkpoint.last_position
	elif Checkpoint.last_position:
		$Player.global_position = Checkpoint.last_position
			

