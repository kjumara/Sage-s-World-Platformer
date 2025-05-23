extends CharacterBody2D

func _process(delta: float) -> void:
	velocity += Vector2(10,10)*delta
	move_and_slide()
