extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Updates global variable so player can respawn to this location if they die
func _on_body_entered(body):
	var save_game:SaveData = SaveData.new()
	save_game.position = global_position
	save_game.progress = Progress.level
	save_game.target_scene = Global.scene
	
	Checkpoint.last_position = global_position 
	ResourceSaver.save(save_game, "user://savegame.tres")
	
	
