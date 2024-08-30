extends CharacterBody2D

## Class for base CharacterBody2D node

## Character's speed
@export var speed: float = 150

## Holds character's movement class
var movement: PlayerMovement

func _ready():
	## Instantiate character's movement
	self.movement = PlayerMovement.new(self.speed)
	
	
func _physics_process(delta):
	## Get direction based on user's input
	var direction = self.movement.get_input()
	
	## Change sprite's animation
	$AnimatedSprite2D.change_state(direction)
	
	## Rotate sprite's action collision
	$ActionCollisionArea.change_rotation(direction)
	
	## Sets velocity
	self.velocity = self.movement.get_input() * self.speed
	
	## Moves character
	self.move_and_slide()
