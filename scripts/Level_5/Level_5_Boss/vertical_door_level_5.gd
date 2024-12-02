extends AnimatableBody2D

@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	if Progress.level >= 5:
		animation_player.play("open")
