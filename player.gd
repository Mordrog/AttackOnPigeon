extends KinematicBody
 
const MOVE_SPEED = 4
const MOUSE_SENS_HORIZONTAL = 0.2
const MOUSE_SENS_VERTICAL = 0.2
 
onready var anim_player = $AnimationPlayer
onready var raycast = $RayCast
onready var health_rect = $CanvasLayer/Health

const MAX_HEALTH = 10.0
const MAX_HEALTH_RED = 0.5
const HIT_HEALTH_RED = 0.75

var health = MAX_HEALTH

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	yield(get_tree(), "idle_frame")
	get_tree().call_group("zombies", "set_player", self)
 
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= MOUSE_SENS_HORIZONTAL * event.relative.x
		rotation_degrees.x -= MOUSE_SENS_VERTICAL * event.relative.y
 
func _process(delta):
	health_rect.modulate.a = lerp(health_rect.modulate.a, MAX_HEALTH_RED - (health/MAX_HEALTH), 0.05)
	if Input.is_action_pressed("exit"):
		get_tree().quit()
	if Input.is_action_pressed("restart"):
		kill()
 
func _physics_process(delta):
	var move_vec = Vector3()
	if Input.is_action_pressed("move_forwards"):
		move_vec.z -= 1
	if Input.is_action_pressed("move_backwards"):
		move_vec.z += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	move_vec = move_vec.rotated(Vector3(0, 1, 0), rotation.y)
	move_and_collide(move_vec * MOVE_SPEED * delta)
   
	if Input.is_action_pressed("shoot") and !anim_player.is_playing():
		anim_player.play("shoot")
		var coll = raycast.get_collider()
		#$"../gui/debug".text = str(raycast.get_collider())
		if raycast.is_colliding() and coll.has_method("kill"):
			coll.kill()
			global.points = global.points + 1 
 
func damage(damage:float):
	health -= damage
	if health < 0:
		kill()
	
	health_rect.modulate.a += HIT_HEALTH_RED

func kill():
	get_tree().reload_current_scene()