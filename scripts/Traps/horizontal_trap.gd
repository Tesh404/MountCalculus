extends Node2D

const SPEED = 60

var direction = 1


# Variables from scene
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var raycast_left = $raycast_left
@onready var raycast_right = $raycast_right


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if raycast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if raycast_left.is_colliding():
		animated_sprite_2d.flip_h = false
		direction = 1 
		
	position.x += direction * SPEED * delta 
