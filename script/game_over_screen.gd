extends Control

@onready var main_menu = "res://scenes/UI/start_menu.tscn"
	
func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file(main_menu)

func _on_quit_pressed() -> void:
	get_tree().quit()
