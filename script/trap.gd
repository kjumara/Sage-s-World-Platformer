extends Node2D

signal touched_player

@export var speed_x = 0
@export var speed_y = 0
@export var max_distance = 0

@onready var base_pos = global_position

func _ready() -> void:
	global_position = base_pos

func _process(delta: float) -> void:
	global_position += Vector2(speed_x*delta,speed_y*delta)
	if global_position.x > base_pos.x+max_distance or global_position.x < base_pos.x-max_distance:
		speed_x = -speed_x
	if global_position.y > base_pos.y+max_distance or global_position.y < base_pos.y-max_distance:
		speed_y = -speed_y
		
func _on_area_2d_body_entered(_body: Node2D) -> void:
	emit_signal("touched_player")
