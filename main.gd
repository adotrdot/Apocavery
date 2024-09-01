extends Node

## Main node that will handles the flow of the game
## from the main menu to the gameplay screen

## Stores scene paths
var main_menu_path: String = "res://resources/interfaces/main_menu/main_menu.tscn"
var gameplay_path: String = "res://levels/level_0/level_0.tscn"

## Stores scene nodes
var main_menu: Control
var gameplay: Node2D

## Stores loading screen's node
@onready var loading_screen: Control = $LoadingScreen


func _ready():
	## Loads main menu screen
	loading_screen.load_scene(main_menu_path)


## Handles completed loading
func _on_loading_screen_loading_complete(loaded_scene: PackedScene):
	var scene_info: SceneState = loaded_scene.get_state()
	
	## Gets scene's name
	var scene_name: String = scene_info.get_node_name(0)
	
	## Do actions based on which scene it is
	match scene_name:
		"MainMenu":
			_start_main_menu(loaded_scene)
		"Level0":
			_start_gameplay(loaded_scene)
			
			
## Starts main_menu screen
func _start_main_menu(scene: PackedScene):
	main_menu = scene.instantiate()
	main_menu.begin_game.connect(_close_main_menu)
	main_menu.exit_game.connect(_quit_game)
	self.add_child(main_menu)


## Closes main_menu screen and transition to game screen
func _close_main_menu():
	loading_screen.load_scene(gameplay_path)
	main_menu.queue_free()


## Start game using the loaded game screen's scene
func _start_gameplay(scene: PackedScene):
	gameplay = scene.instantiate()
	gameplay.to_main_menu.connect(_close_gameplay)
	self.add_child(gameplay)


## Closes gameplay screen and transition to main menu
func _close_gameplay():
	loading_screen.load_scene(main_menu_path)
	gameplay.queue_free()


## Quits from game
func _quit_game():
	self.get_tree().quit()
