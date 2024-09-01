extends Node2D

## Class for a gameplay level

## Stores the timer
@onready var timer: Timer = $Timer

## Stores the gameplay interface to make changes when needed
@onready var interface: CanvasLayer = $GameplayInterface

## Holds the gameplay time, defaults to 60s
@export var gameplay_time: int = 60


func _ready():
	## Sets initial score
	ScoreSystem.reset_score()
	interface.set_score(ScoreSystem.current_score)
	
	## Sets timer and starts it
	interface.set_time(gameplay_time)
	timer.set_one_shot(false)
	timer.start(1)


## Updates time UI on timer timeout, game over when gameplay_time reached 0
func _on_timer_timeout():
	gameplay_time -= 1
	interface.set_time(gameplay_time)


## Updates score UI on successful package delivery
func _on_player_package_delivered(package):
	ScoreSystem.current_score += 1
	interface.set_score(ScoreSystem.current_score)
