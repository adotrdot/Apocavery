extends Node

## Class for the score system
## Holds the current high score and handles current score.

## Stores the path to file that stores high score
var path: String = "user://score.dat"

var high_score: int = 0
var current_score: int = 0

## Stores whether this script has been auto loaded
var is_ready = false


func _ready():
	self._open_high_score_file()
	high_score = self.get_high_score()
	
	self.is_ready = true
	
	
## Opens the corresponding file that holds the high score value
func _open_high_score_file() -> FileAccess:
	return FileAccess.open(path, FileAccess.WRITE_READ)

	
## Saves high score to file
func _save_high_score_to_file():
	var file: FileAccess = _open_high_score_file()
	file.store_32(self.high_score)
	file.close()

	
## Reads score file, gets the high score and returns it
func get_high_score() -> int:
	var file: FileAccess = _open_high_score_file()
	
	## Ignore file if it's still empty
	if file.get_length() == 0:
		return 0
	
	## Gets high score and close the file
	var score: int = file.get_32()
	file.close()
	
	return score
	
	
## Saves high score
func save_high_score(score: int):
	## Skips if score is not higher than high score
	if score <= self.high_score:
		return
		
	## Sets high_score variable to the new score
	self.high_score = score
	
	self._save_high_score_to_file()


## Resets current score
func reset_score():
	self.current_score = 0
