extends Node

@onready var player
@onready var scene 


# Variable to help player spawn at the same location after chaning scene
var door_name = null

func register_player(playernode):
	player = playernode

func register_scene(inscene):
	scene = inscene


