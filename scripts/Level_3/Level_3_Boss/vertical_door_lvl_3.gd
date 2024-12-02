extends AnimatableBody2D


@onready var animation_player = $AnimationPlayer

func _ready():
	if Progress.level >= 3:
		animation_player.play("open")
