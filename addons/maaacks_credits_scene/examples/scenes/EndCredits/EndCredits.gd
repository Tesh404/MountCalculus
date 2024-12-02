@tool
extends Credits

@export_file("*.tscn") var main_menu_scene : String
@export var audio: AudioStream
func _end_reached():
	%EndMessagePanel.show()
	super._end_reached()

func _on_MenuButton_pressed():
	get_tree().change_scene_to_file(main_menu_scene)
	# If Maaack's Scene Loader is installed, use this instead:
	# SceneLoader.load_scene(main_menu_scene)

func _on_ExitButton_pressed():
	get_tree().change_scene_to_file(main_menu_scene)

func _ready():
	if Music.check_music() != audio:
		Music.play_background(audio)
	if main_menu_scene.is_empty():
		%MenuButton.hide()
	if OS.has_feature("web"):
		%ExitButton.hide()
	super._ready()

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		if not %EndMessagePanel.visible:
			_end_reached()
		else:
			get_tree().quit()
