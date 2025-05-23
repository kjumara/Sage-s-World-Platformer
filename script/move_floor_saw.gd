extends Node2D

@onready var start_pos = $start.global_position
@onready var end_pos = $end.global_position
@onready var top = $top

signal touched_player

var direction = 1
var speed = 100
func _ready() -> void:
	top.global_position = start_pos
	
func _process(delta: float) -> void:
	if direction>0:
		if top.global_position.x > end_pos.x:
			direction = -1
		else:
			top.global_position.x+=speed*delta
	else:
		if top.global_position.x < start_pos.x:
			direction = 1
		else:
			top.global_position.x-=speed*delta


func _on_player_entered(_body: Node2D) -> void:
	touched_player.emit()
