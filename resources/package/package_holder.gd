extends Control

## Class for package holder

## Stores each packages' texture
var red_package: Texture2D = preload("res://resources/package/red_package.png")
var blue_package: Texture2D = preload("res://resources/package/blue_package.png")
var brown_package: Texture2D = preload("res://resources/package/brown_package.png")
var PACKAGE_TEXTURES = {
	Package.RED: red_package,
	Package.BLUE: blue_package,
	Package.BROWN: brown_package
}

## Stores package icon's node
@onready var package_icon: TextureRect = $PackageIcon


## Sets package's icon based on package's type, if not null
func set_package_icon(package: Package):
	package_icon.set_texture(PACKAGE_TEXTURES[package.type] if package != null else null)
