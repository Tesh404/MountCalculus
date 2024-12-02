extends Node2D

const SPEED = 60

var direction = 1

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var raycast_down = $raycast_down
@onready var raycast_up = $raycast_up


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if raycast_down.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false
	if raycast_up.is_colliding():
		animated_sprite_2d.flip_h = true
		direction = 1
		
	position.y += direction * SPEED * delta 
