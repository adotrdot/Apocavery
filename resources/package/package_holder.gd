extends Control

## Class for package holder

## Stores package icon's node
@onready var package_icon: TextureRect = $PackageIcon


## Sets package's icon based on package's type, if not null
func set_package_icon(package: Package):
	package_icon.set_texture(Package.PACKAGE_TEXTURES[package.type] if package != null else null)
