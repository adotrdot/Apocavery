extends AnimatedSprite2D
class_name PlayerAnim

## Class for character's animation logic
## Character must have animation for each of 4 directions, named "up", "left", "down", and "right"

## Stores matching inputs and animations
const ANIM_KEYS = {
	Vector2.UP: "up",
	Vector2.DOWN: "down",
	Vector2.LEFT: "left",
	Vector2.RIGHT: "right"
}


func _ready():
	## Default animation state is facing down
	self.set_autoplay(ANIM_KEYS[Vector2.DOWN])
	
	
## Sets animation based on direction
func change_state(direction: Vector2):
	## Stops animation if direction is (0,0)
	if direction == Vector2.ZERO:
		self.stop()
	else:
		self.set_animation(ANIM_KEYS[direction])
		self.play()
