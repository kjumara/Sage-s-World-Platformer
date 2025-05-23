extends Control

@onready var main_menu = "res://scenes/UI/start_menu.tscn"
@onready var credits = "res://scenes/UI/credits.tscn"
	
func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file(main_menu)

func _on_quit_pressed() -> void:
	get_tree().quit()

func _ready() -> void:
	Audioplayer.play_win(true)


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file(credits)
