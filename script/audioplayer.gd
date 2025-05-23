extends Node

var hurt = preload("res://assets/sounds/sounds_1/hurt.ogg")
var win_sound = preload("res://assets/sounds/sounds_1/level_won.ogg")
var jump = preload("res://assets/sounds/sounds_2/SFX_Jump_22.wav")
var checkpoint = preload("res://assets/sounds/sounds_1/checkpoint.ogg")

func _ready() -> void:
	play_win(false)

func play_sfx(sfx_name: String):
	
	var stream = null
	if sfx_name == "hurt":
		stream = hurt
	elif sfx_name == "jump":
		stream = jump
	elif sfx_name == "win sound":
		stream = win_sound
	elif sfx_name == "checkpoint":
		stream = checkpoint
	else:
		print("Invalid sfx name")
		return
		
	var asp = AudioStreamPlayer.new()
	asp.pitch_scale = randf_range(0.5,1.5)
	asp.volume_db+=5
	asp.stream = stream
	asp.name = "SFX"
	
	add_child(asp)
	asp.play()
	
	await asp.finished
	asp.queue_free()

func play_win(decision: bool):
	$MusicPlayer.playing = (not decision)
	$MusicPlayer2.playing = (decision)
