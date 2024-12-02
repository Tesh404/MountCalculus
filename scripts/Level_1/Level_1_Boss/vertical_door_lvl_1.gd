extends AnimatableBody2D


@onready var animation_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
# Door to lock progression onto the next level
# Uses global variable "Progress"
# If player does not answer enough questions correcntly, then variable stays 0
func _ready():
	if Progress.level >= 1:
		animation_player.play("open")
