extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var introVideo = $VideoPlayer
onready var killThemAudio = $AudioStreamPlayer
onready var timer = $Timer

var isChangeScreenNeeded = false
var startGame = true

# Called when the node enters the scene tree for the first time.
func _ready():
	startGame = true
	introVideo.play()
	pass # Replace with function body.

func _process(delta):
	if startGame:
		
		if not introVideo.is_playing():
			if Input.is_key_pressed(KEY_SPACE):
				isChangeScreenNeeded = true
				killThemAudio.play(0.0)
				timer.start(6)
	else:
		if Input.is_key_pressed(KEY_SPACE):
			startGame = true
			introVideo.play()

func timer_timeout_callback():
	get_tree().change_scene("res://TestMap.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
