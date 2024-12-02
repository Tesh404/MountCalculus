
extends Node
class_name SaveSystem


func save_game():
	var save__game:SaveData = SaveData.new()
	save__game.position = Global.player.get_position()
	save__game.progress = Progress.level
	save__game.target_scene = Global.scene
	
	ResourceSaver.save(save__game, "user://savegame.tres")
	
func load_game():
	var save__game:SaveData = load("user://savegame.tres") as SaveData
	Checkpoint.last_position = save__game.position
	Progress.level = save__game.progress
	SceneTransition.change_scene(save__game.target_scene)
	
	
