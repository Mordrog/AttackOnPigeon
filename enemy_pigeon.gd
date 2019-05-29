extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum PIGEON_STATE {
	IDLE,
	FLYING,
	DEAD_FALL,
	DEAD
}

onready var raycast = $RayCast

var PLAYER_DETECTION_RANGE = 4.0
var IDLE_TIMEOUT = 2.0
var FLYING_TIMEOUT = 5.0
var DEADFALL_TIMEOUT = 1.0
var current_state_timeout = 0
var current_state = PIGEON_STATE.IDLE
var sprite;
var player = null
var start_y_pos = 0
var FLYING_HEIGHT = 2.0
var flying_direction = null
var current_position = Vector3.ZERO
var FLYING_SPEED = 3.0
var isDead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	current_position = translation
	randomize()
	start_y_pos = translation.y
	for child in get_children():
		if child is Sprite3D:
			sprite = child
			break
	add_to_group("zombies")
	pass # Replace with function body.

func _process(delta):
	if isDead:
        return
	
	var hasPlayerPosition = false
	var playerPosition = null
	if player != null:
		var vec_to_player = player.translation - translation
		if vec_to_player.length() < PLAYER_DETECTION_RANGE:
			hasPlayerPosition = true
			playerPosition = vec_to_player
			playerPosition.y = 0
			
	current_state_timeout -= delta	
	match current_state:
		PIGEON_STATE.FLYING:
			if current_state_timeout <= 0:
				rand_next_state()
				
			pass
			
		PIGEON_STATE.IDLE:
			if current_state_timeout <= 0:
				rand_next_state()
			pass
			# Move pigeon in selected direction
	
	update_frame()

func _physics_process(delta):
	if isDead:
        return
	if current_state == PIGEON_STATE.FLYING:

		var collision = move_and_collide(flying_direction * delta * FLYING_SPEED)
		if collision != null:
			set_flying_state()
		if translation.y > FLYING_HEIGHT:
			flying_direction.y = -flying_direction.y
		if translation.y <= start_y_pos:
			flying_direction.y = -flying_direction.y

	pass

func rand_next_state():
	var possible_states = [PIGEON_STATE.IDLE, PIGEON_STATE.FLYING]
	var new_state = possible_states[randi() % possible_states.size()]
	match new_state:
		PIGEON_STATE.IDLE:
			set_idle_state()
		PIGEON_STATE.FLYING:
			set_flying_state()

func set_idle_state():
	current_state = PIGEON_STATE.IDLE
	current_state_timeout = IDLE_TIMEOUT * rand_range(0.9, 1.1)
	translation.y = start_y_pos

func set_flying_state():
	current_state = PIGEON_STATE.FLYING
	current_state_timeout = FLYING_TIMEOUT * rand_range(0.9, 1.1)
	
	var new_dir_vector = Vector3(
		rand_range(-1, 1),
		rand_range(-0.2, 0.2),
		rand_range(-1, 1))
		
	flying_direction = new_dir_vector.normalized()
	
	#translation.y = FLYING_HEIGHT

func set_dead_fall_state():
	current_state = PIGEON_STATE.DEAD_FALL
	current_state_timeout = DEADFALL_TIMEOUT

func kill():
    isDead = true
    $CollisionShape.disabled = true
	
    #anim_player.play("die")

func update_frame():
	match current_state:
		PIGEON_STATE.IDLE:
			sprite.frame = 0
		PIGEON_STATE.FLYING:
			sprite.frame = 1

func set_player(p):
    player = p

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
