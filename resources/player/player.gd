extends CharacterBody2D

## Class for base CharacterBody2D node

## Character's speed
@export var speed: float = 150

## Holds character's movement class
var movement: PlayerMovement

## Holds character's actions
@onready var action = $ActionCollisionArea

## Holds character's animation
@onready var anim = $AnimatedSprite2D

## Holds the package that's the character's carrying
var cur_package: Package = null

## Signal for whenever the package the player's carrying is changed.
## Emitted by PlayerAction when needed.
signal package_changed(package: Package)

## Signal for whenever a package is successfully delivered.
## Emitted by PlayerAction when needed.
signal package_delivered(package: Package)

func _ready():
	## Instantiate character's movement
	self.movement = PlayerMovement.new(self.speed)
	
	
func _physics_process(delta):
	## Get direction based on user's input
	var direction = self.movement.get_input()
	
	## Change sprite's animation
	anim.change_state(direction)
	
	## Rotate sprite's action collision
	action.change_rotation(direction)
	
	## Sets velocity
	self.velocity = self.movement.get_input() * self.speed
	
	## Moves character
	self.move_and_slide()


func _process(delta):
	## Handle user's input relating to character's actions
	action.handle_input()
