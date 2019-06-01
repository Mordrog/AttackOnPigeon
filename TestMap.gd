extends Spatial
 
var laser_burn_scene = load("res://LaserBurn.tscn")

var seconds = 0 
var pigeon_generate_rate = 0.5
var MAX_GENERATE_RATE = 10.0
var isPigeonNeeded = false

onready var pigeonTimer = $PigeonTimer

# Called when the node enters the scene tree for the first time.
func _ready(): 
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (global.activePigeons < 400 && isPigeonNeeded):
		var scene = load("res://EnemyPiegon.tscn")
		var scene_instance = scene.instance()
		scene_instance.set_name("scene" + str(global.activePigeons))
		scene_instance.set_player($Player)
  		
		var min_pos_x = 17.35 - 10.0
		var max_pos_x = 17.35 + 10.0
		var min_pos_z = 1.915 - 10.0
		var max_pos_z = 1.915 + 10.0
		
		scene_instance.set_translation(Vector3(
			rand_range(min_pos_x,max_pos_x),
			1.4,
			rand_range(min_pos_z,max_pos_z)))
		scene_instance.start_y_pos = 0.6
		add_child(scene_instance)

		if pigeon_generate_rate < MAX_GENERATE_RATE:
			pigeon_generate_rate += 0.2
			
		pigeonTimer.wait_time = 1 / pigeon_generate_rate 
		isPigeonNeeded = false
		pass

	pass

	
	
func _physics_process(delta):
	$Points.text = str(global.points) 
	pass
 
func _on_PigeonTimer_timeout():
	#print(str(seconds))
	#seconds += 1
	#if seconds > 2: 
	#	seconds = 0
	#	pass
	isPigeonNeeded = true
	pass # Replace with function body.

func _spawn_burn(position:Vector3, rotation:Vector3):
	var laser_burn = laser_burn_scene.instance()
	laser_burn.look_at(rotation * -1, Vector3.UP)
	laser_burn.translation = position
	add_child(laser_burn)