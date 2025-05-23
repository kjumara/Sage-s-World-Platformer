extends Node2D

@export var next_level: PackedScene = null

@onready var win_screen = "res://scenes/UI/win_screen.tscn"

@onready var player_start_pos = $base_objects/Marker2D.global_position
@onready var player = $base_objects/Player
@onready var starfruit = $Starfruit
@onready var hud = $UI/HUD
@onready var game_over = $UI/Game_Over_Screen
#@onready var checkpoint_location = $base_objects/Checkpoint2.global_position

func _ready() -> void:
	hud.reset_hearts()
	player.global_position = player_start_pos
	#	player.global_position = checkpoint_location#for debugging


func _on_death_zone_touched(_body: Node2D) -> void:
	_player_damaged(2)


func _on_starfruit_touched(_body: Node2D) -> void:
	Audioplayer.play_sfx("win sound")
	starfruit.win()
	player.speed=0
	player.jump_force=0
	player.gravity=0
	player.velocity = Vector2.ZERO
	await get_tree().create_timer(1.5).timeout
	if next_level:
		get_tree().change_scene_to_packed(next_level)
	else:
		get_tree().change_scene_to_file(win_screen)
	


func _all_lives_lost() -> void:
	game_over.visible = true


func _on_trap_touched_player() -> void:
	_player_damaged(1)
	
func _player_damaged(dmg_amt):
	Audioplayer.play_sfx("hurt")
	player.global_position = player_start_pos
	player.velocity = Vector2.ZERO
	for x in dmg_amt:
		hud.lost_heart()

func _on_checkpoint_touched() -> void:
	player_start_pos = player.global_position


func _on_crushing_platform_touched(_body: Node2D) -> void:
	_player_damaged(2)
