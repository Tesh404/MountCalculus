extends Node2D


# Uses code originally from slime.gd, just with different sprite.
# Speed of the bat
const SPEED = 100

# Default direction of the bat
var direction = 1

# Getting variables from scene and assigning variable to them
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var raycast_left = $raycast_left
@onready var raycast_right = $raycast_right


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Change in direction based on whether enemy is colliding with an object
	if raycast_right.is_colliding():
		animated_sprite_2d.flip_h = false
		direction = -1
	if raycast_left.is_colliding():
		animated_sprite_2d.flip_h = true
		direction = 1 
	
	position.x += direction * SPEED * delta 
