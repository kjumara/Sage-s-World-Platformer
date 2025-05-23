extends Node2D

signal touched_player

@onready var animation = $AnimatedSprite2D

func _on_area_2d_body_entered(_body: Node2D) -> void:
	emit_signal("touched_player")
	if not animation.is_playing():
		Audioplayer.play_sfx("checkpoint")
	animation.play("activated")
	
