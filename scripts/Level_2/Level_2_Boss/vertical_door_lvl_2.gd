extends AnimatableBody2D

@onready var animation_player = $AnimationPlayer

func _ready():
	if Progress.level >= 2:
		animation_player.play("open")
