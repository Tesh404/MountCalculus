extends Area2D


@export_file("*.tscn") var target_scene: String

@onready var interact_label = $"Interact Label"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 


# Check if user presses the "interact" button or "E" on keyboard.
# Changes scene if player is in boundary and scene exists
func _input(event):
	if event.is_action_pressed("interact"):
		if !target_scene:
			return
		if get_overlapping_bodies().size() > 0:
			next_scene()

# Changes scene to specified scene in inspector
func next_scene():
	Checkpoint.last_position = null
	SceneTransition.change_scene(target_scene)
	Global.door_name = name


func _on_body_entered(body):
	interact_label.visible = true


func _on_body_exited(body):
	interact_label.visible = false
