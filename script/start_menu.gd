extends Control

@export var level_one : PackedScene = null

func _ready() -> void:
	Audioplayer.play_win(false)
	
func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(level_one)
