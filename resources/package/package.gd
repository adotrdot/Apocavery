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

## Stores each packages' texture
static var red_package: Texture2D = preload("res://resources/package/red_package.png")
static var blue_package: Texture2D = preload("res://resources/package/blue_package.png")
static var brown_package: Texture2D = preload("res://resources/package/brown_package.png")
static var PACKAGE_TEXTURES = {
	self.RED: red_package,
	self.BLUE: blue_package,
	self.BROWN: brown_package
}


func _init(type: int):
	## Handle wrong type of package
	assert(type in [self.RED, self.BLUE, self.BROWN], "Wrong type of package")
	
	self.type = type
