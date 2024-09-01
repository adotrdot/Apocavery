extends Node2D

## Class for a gameplay level

## Stores the timer
@onready var timer: Timer = $Timer

## Stores the gameplay interface to make changes when needed
@onready var interface: CanvasLayer = $GameplayInterface

## Holds the gameplay time, defaults to 60s
@export var gameplay_time: int = 60

## Stores pause screen's node
@onready var pause_screen_scene: PackedScene = preload("res://resources/interfaces/pause_screen/pause_screen.tscn")
var pause_screen: Control

## Stores gameover's node
@onready var gameover_screen_scene: PackedScene = preload("res://resources/interfaces/gameover/gameover.tscn")
var gameover_screen: Control

## Signal to go back to main menu
signal to_main_menu


func _ready():
	## Sets initial score
	ScoreSystem.reset_score()
	interface.set_score(ScoreSystem.current_score)
	
	## Sets initial package icon
	interface.set_package_icon(null)
	
	## Sets timer and starts it
	interface.set_time(gameplay_time)
	timer.set_one_shot(false)
	timer.start(1)


## Process pause input.
## See details concerning the pause mechanism in pause_screen.tscn
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		_pause_game()


## Updates time UI on timer timeout, game over when gameplay_time reached 0
func _on_timer_timeout():
	gameplay_time -= 1
	interface.set_time(gameplay_time)
	
	## If time is out, stops timer and calls gameover function
	if gameplay_time == 0:
		timer.stop()
		_gameover()


## Updates score UI on successful package delivery
func _on_player_package_delivered(package):
	## Resets package icon
	interface.set_package_icon(null)
	
	## Increment score
	ScoreSystem.current_score += 1
	interface.set_score(ScoreSystem.current_score)


## Updates package holder's icon on package pickup
func _on_player_package_changed(package):
	interface.set_package_icon(package)


## Pause game
func _pause_game():
	## Instantiate pause screen
	pause_screen = pause_screen_scene.instantiate()
	pause_screen.resume.connect(_resume_game)
	pause_screen.quit.connect(_back_to_main_menu)
	interface.add_child(pause_screen)
	
	## Pause process
	self.get_tree().paused = true
	

## Resume game from paused state
func _resume_game():
	## Resume process
	self.get_tree().paused = false
	
	pause_screen.queue_free()
	pause_screen = null
	
	
## Back to main menu from paused state
func _back_to_main_menu():
	self.to_main_menu.emit()


## Gameover methods
func _gameover():
	## Instantiate gameover screen
	gameover_screen = gameover_screen_scene.instantiate()
	gameover_screen.set_score_value(ScoreSystem.current_score)
	gameover_screen.confirm.connect(_back_to_main_menu)
	interface.add_child(gameover_screen)
	
	## Pause process
	self.get_tree().paused = true
