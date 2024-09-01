extends Control

## Class for loading screen
## Used to do background loading of scenes

## Stores color rect and text's nodes
@onready var rect: ColorRect = $ColorRect
@onready var text: Label = $LoadingText
@onready var anim: AnimationPlayer = $AnimationPlayer

## Stores path to scene that is going to be loaded
var scene_to_load = null

## Signals to mark loading complete
signal loading_complete(loaded_scene: PackedScene)


func _ready():
	_hide_elements()


## Checks if scene has loaded inside process loop
func _process(delta):
	if scene_to_load != null:
		## If loading has finished, emits signal and play fadeout anim
		if _is_scene_loaded():
			anim.play("fadeout")
			loading_complete.emit(ResourceLoader.load_threaded_get(scene_to_load))


## Hides elements by setting its modulate
func _hide_elements():
	rect.set_modulate(Color(255,255,255,0))
	text.set_modulate(Color(255,255,255,0))
	
	## Resets scene_to_load to null
	scene_to_load = null


## Checks if scene has loaded
func _is_scene_loaded():
	return ResourceLoader.load_threaded_get_status(scene_to_load) == ResourceLoader.THREAD_LOAD_LOADED


func load_scene(path: String):
	scene_to_load = path
	
	## Begin fadein
	anim.play("fadein")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadein":
		## Send request to begin loading resource
		var scene = ResourceLoader.load_threaded_request(scene_to_load)
		
	elif anim_name == "fadeout":
		_hide_elements()
