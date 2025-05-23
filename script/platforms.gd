extends Node2D

@onready var base_pos = global_position

@export var speed = Vector2(0,0)
@export var distance = 0


func _process(delta: float) -> void:
	global_position+=speed*delta
	if global_position.x > base_pos.x+distance or global_position.x < base_pos.x-distance:
		speed.x = -speed.x
	if global_position.y > base_pos.y+distance or global_position.y < base_pos.y-distance:
		speed.y = -speed.y
