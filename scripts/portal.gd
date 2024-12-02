extends Area2D

@export_file("*.tscn") var target_scene0: String
@export_file("*.tscn") var target_scene1: String
@export_file("*.tscn") var target_scene2: String
@onready var interact_label = $"Interact Label"

# Picks a random scene from the array
func pickScene():
	var scenes: Array = [target_scene0, target_scene1, target_scene2]
	SceneTransition.change_scene(scenes.pick_random())


# Check if user presses the "interact" button or "E" on keyboard.
# Changes scene if player is in boundary and scene exists
func _input(event):
	if event.is_action_pressed("interact"):
		if get_overlapping_bodies().size() > 0:
			pickScene()
			



func _on_body_entered(body):
	interact_label.visible = true


func _on_body_exited(body):
	interact_label.visible = true
