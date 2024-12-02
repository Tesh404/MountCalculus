extends AnimatableBody2D


@onready var timer = $Timer
@onready var animation_player = $AnimationPlayer


func _ready():
	timer.start()
	


func _on_timer_timeout():
	animation_player.play("move")
	timer.queue_free()
