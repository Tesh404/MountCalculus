extends Node2D

@onready var progress_bar = $ProgressBar


# Normal player health decrease
func health_decrease():
	progress_bar.value -= 60

# Health decrease for first 4 bosses
func boss_health_decrease():
	progress_bar.value -= 30

func final_boss_decrease():
	progress_bar.value -= 20
