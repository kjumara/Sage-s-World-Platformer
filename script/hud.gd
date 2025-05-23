extends Control

@onready var last_heart = $heart_1
@onready var middle_heart = $heart_2
@onready var first_heart = $heart_3
@onready var empty_heart = preload("res://assets/UI/empty_heart.png")
@onready var half_heart = preload("res://assets/UI/half_heart.png")
@onready var full_heart = preload("res://assets/UI/full_heart.png")

signal health_depleted

func lost_heart():
	if first_heart.texture == full_heart:
		first_heart.texture = half_heart
	elif first_heart.texture == half_heart:
		first_heart.texture = empty_heart
	elif middle_heart.texture == full_heart:
		middle_heart.texture = half_heart
	elif middle_heart.texture == half_heart:
		middle_heart.texture = empty_heart
	elif last_heart.texture == full_heart:
		last_heart.texture = half_heart
	elif last_heart.texture == half_heart:
		last_heart.texture = empty_heart
	else:
		health_depleted.emit()

func reset_hearts():
	first_heart.texture = full_heart
	middle_heart.texture = full_heart
	last_heart.texture = full_heart


func _on_ui_ready() -> void:
	reset_hearts()
