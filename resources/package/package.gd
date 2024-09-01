extends Object
class_name Package

## Class for a package
## Has 3 types of package available, that is Red, Blue, and Vrown

## Enums to stores types of packages
enum {
	RED,
	BLUE,
	BROWN
}

## Stores the type of current package
var type: int


func _init(type: int):
	## Handle wrong type of package
	assert(type in [self.RED, self.BLUE, self.BROWN], "Wrong type of package")
	
	self.type = type
