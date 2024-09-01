extends Node2D

## Class for package notifier

## Stores package icon's node
@onready var package_icon: Sprite2D = $PackageIcon


## Sets notifier's icon and shows it on screen, if given package is not null
func notify(package: Package):
	if package == null:
		return
		
	## Sets package's texture
	package_icon.set_texture(Package.PACKAGE_TEXTURES[package.type])
	
	## Display node
	self.show()
	
	
## Hides notifier
func drop():
	self.hide()
