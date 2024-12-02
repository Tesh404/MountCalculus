extends Node2D



@onready var area_2d = $Area2D
@onready var page_1 = $Page_1
@onready var interact_label = $"Interact Label"




# Counter variable to keep track of page in the book
var counter = 0

# Active variable to help enable/disable player movement when interacting with books
var active = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Book opens if player is within the boundary and presses interact button(E)
func _input(event):
	var pages = [page_1]
	if event.is_action_pressed("interact"):
		if area_2d.get_overlapping_bodies().size() > 0:
			active = !active
			if active == false:
				disablePlayer()
			else:
				enablePlayer()
			pages[counter].visible = !pages[counter].visible 


# Disables player movement
func disablePlayer():
	var player = get_tree().get_root().find_child("Player", true, false)
	if player:
		player.set_active(false)

# Enables player movement
func enablePlayer():
	var player = get_tree().get_root().find_child("Player", true, false)
	if player:
		player.set_active(true)



func _on_area_2d_body_entered(body):
	interact_label.visible = true


func _on_area_2d_body_exited(body):
	interact_label.visible = false
