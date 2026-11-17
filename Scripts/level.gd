extends Node3D


func _ready() -> void:
	pass


func _process(delta) -> void:
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
