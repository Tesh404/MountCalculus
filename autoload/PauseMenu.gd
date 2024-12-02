extends CanvasLayer

@export_file("*.tscn") var target_scene: String
@onready var texture_rect = $TextureRect
@onready var buttons = $buttons
@onready var h_slider = $buttons/HSlider

var volume = AudioServer.get_bus_index("Background")


func _input(event):
	# Scene disabled in main menu and credits
	if get_tree().current_scene.name == "main_menu" or get_tree().current_scene.name == "EndCredits":
		pass
	else:
		if event.is_action_pressed("Pause"):
			texture_rect.visible = !texture_rect.visible
			buttons.visible = !buttons.visible
			get_tree().paused = !get_tree().paused


func _on_resume_pressed():
	texture_rect.visible = !texture_rect.visible
	buttons.visible = !buttons.visible
	get_tree().paused = false


func _on_main_menu_pressed():
	get_tree().paused = false
	SceneTransition.change_scene(target_scene)
	texture_rect.visible = !texture_rect.visible
	buttons.visible = !buttons.visible


func _on_quit_pressed():
	get_tree().quit()


func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(volume, linear_to_db(value))
