extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if Progress.level >= 4:
		animated_sprite_2d.play("death")
