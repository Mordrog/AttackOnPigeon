extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var introVideo = $VideoPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	introVideo.play()
	pass # Replace with function body.

func _process(delta):
	if not introVideo.is_playing():
		if Input.is_key_pressed(KEY_SPACE):
			get_tree().change_scene("res://TestMap.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
