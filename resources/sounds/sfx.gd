extends AudioStreamPlayer

## Class for handling sound effects

## Stores sfx paths
var delivery_sound: AudioStream = preload("res://resources/sounds/delivery_sound.wav")
var pickup_sound: AudioStream = preload("res://resources/sounds/pickup_sound.wav")


## Plays an audio
func _play(audio_stream: AudioStream):
	self.set_stream(audio_stream)
	self.play()


## Plays pickup sound whenever a package has been picked up
func _on_player_package_changed(package):
	self._play(self.pickup_sound)


## Plays delivery sound whenever a package has been delivered
func _on_player_package_delivered(package):
	self._play(delivery_sound)
