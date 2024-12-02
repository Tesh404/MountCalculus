extends Node2D

# Speed of slime
const SPEED = 60

# Default direction
var direction = 1 

# Assigning variables to node
@onready var raycast_right = $raycast_right
@onready var raycast_left = $raycast_left
@onready var animated_sprite_2d = $AnimatedSprite2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Change in direction based on whether enemy is colliding with an object
	if raycast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if raycast_left.is_colliding():
		animated_sprite_2d.flip_h = false
		direction = 1 
	
	position.x += direction * SPEED * delta 
	

