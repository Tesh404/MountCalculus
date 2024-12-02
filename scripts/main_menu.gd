extends Node

@export var audio: AudioStream
@export_file("*.tscn") var target_scene: String
@export_file("*.tscn") var tutorial_scene: String
@export_file("*.tscn") var credits_scene: String
@onready var confirm = $Confirm_scene
@onready var main_scene = $main_scene



func _ready():
	if Music.check_music() != audio:
		Music.play_background(audio)
	
func _on_new_game_pressed():
	confirm.visible = true
	main_scene.visible = false



func _on_continue_pressed():
	if FileAccess.file_exists("user://savegame.tres"):
		var load_save = SaveSystem.new()
		load_save.load_game()
	else:
		SceneTransition.change_scene(target_scene)


func _on_quit_pressed():
	get_tree().quit()



func _on_back_pressed():
	confirm.visible = false
	main_scene.visible = true
	


func _on_yes_pressed():
	Checkpoint.last_position = null
	SceneTransition.change_scene(target_scene)



func _on_tutorial_pressed():
	SceneTransition.change_scene(tutorial_scene)


func _on_credits_pressed():
	get_tree().change_scene_to_file(credits_scene)
