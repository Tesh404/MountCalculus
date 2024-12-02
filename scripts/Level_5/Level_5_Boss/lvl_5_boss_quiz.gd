extends Control

@export var audio: AudioStream
@export_file("*.tscn") var target_scene: String
@export_file("*.tscn") var credits_scene: String


@onready var Question = $Label
@onready var Choices = $ItemList
@onready var boss = $AnimatedSprite2D
@onready var player = $AnimatedSprite2D2
@onready var player_health = $PlayerHealth
@onready var boss_health = $BossHealth




# Uses the custom read_json_file function to read and convert to array
var items : Array = read_json_file("questions/level_5_boss_questions.json")

# Selected item
var item : Dictionary

# Index of current item
var index_item : int = 0

# Number of correct items
var correct : int = 0
var incorrect : int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	if Music.check_music() != audio:
		Music.play_background(audio)
	items.shuffle()
	refresh_scene()


func refresh_scene():
	# If index is greater than or equal to array size, game will end
	if index_item > 6 or incorrect > 1 or correct == 6:
		show_result()
	else:
		show_question()


# Method to read json file 
func read_json_file(filename):
	var file = FileAccess.open(filename, FileAccess.READ)
	var text = file.get_as_text()
	return JSON.parse_string(text)
	

# Method to display questions
func show_question():
	Choices.show()
	Choices.clear()
	item = items[index_item]
	Question.text = item.question 
	var options = item.options
	for option in options:
		Choices.add_item(option)

# Method to display results
func show_result():
	Choices.hide()
	var result
	if correct >= 6:
		result = "You have completed the game! Thank you for playing!"
		Progress.level = 5
		boss.play("death")
	else:
		result = "Unfortunately, you did not pass the test, try again."
		player.play("dead")
	Question.text = "{result}".format({"result": result})


func _on_item_list_item_selected(index):
	if index == item.correctOptionIndex:
		correct += 1
		boss_health.final_boss_decrease()
		boss.play("hurt")
		player.play("attack")
	else:
		incorrect += 1
		player_health.health_decrease()
		boss.play("attack")
		player.play("hit")
	index_item += 1 
	refresh_scene()


# Changes scene back to main game when button is pressed
func _on_button_pressed():
	SceneTransition.change_scene(target_scene)





func _on_animated_sprite_2d_animation_finished():
	if boss.animation == "death":
		pass
	else:
		boss.play("idle")
	
	
	
func _on_animated_sprite_2d_2_animation_finished():
	if player.animation == "dead":
		pass
	else:
		player.play("idle")



