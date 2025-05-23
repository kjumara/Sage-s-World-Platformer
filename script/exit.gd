extends Area2D

@export_enum("red","l_blue","green","d_blue") var animation_choice: String = "l_blue"
@onready var animated_sprite = $AnimatedSprite2D
@onready var sparkles = $CPUParticles2D
@export var sparkle_size = [7, 10]

func _ready() -> void:
	animate(animation_choice)
	sparkles.scale_amount_min = sparkle_size[0]
	sparkles.scale_amount_max = sparkle_size[1]

func animate(animation):
	animated_sprite.play(animation)
	
func win():
	animated_sprite.speed_scale = 4
	sparkles.emitting = true
	
	
