extends Node2D

@export var offset = Vector2(0, -320)
@export var duration = 5.0
@export_enum("sand","ice","dirt","stone") var platform_type: String = "sand"

func _ready():
	if platform_type == "ice":
		$AnimatableBody2D/MovingPlatforms.frame = 1
	if platform_type == "dirt":
		$AnimatableBody2D/MovingPlatforms.frame = 2
	if platform_type == "stone":
		$AnimatableBody2D/MovingPlatforms.frame = 3
	start_tween()

func start_tween():
	var tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property($AnimatableBody2D, "position", offset, duration / 2)
	tween.tween_property($AnimatableBody2D, "position", Vector2.ZERO, duration / 2)
