extends Spatial
 
var laser_burn_scene = load("res://LaserBurn.tscn")

var seconds = 0 

# Called when the node enters the scene tree for the first time.
func _ready(): 
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (global.activePigeons < 400 && seconds == 2):
		var scene = load("res://EnemyPiegon.tscn")
		var scene_instance = scene.instance()
		scene_instance.set_name("scene" + str(global.activePigeons))
		scene_instance.set_player($Player)
  	
		scene_instance.set_translation(Vector3(rand_range(-40,40),1.4,rand_range(-40,40)))
		scene_instance.start_y_pos = 0.6
		add_child(scene_instance)
		seconds = 0  
		pass
	pass
	
func _physics_process(delta):
	$Points.text = str(global.points) 
	pass
 
func _on_PigeonTimer_timeout():
	print(str(seconds))
	seconds += 1
	if seconds > 2: 
		seconds = 0
		pass
	pass # Replace with function body.

func _spawn_burn(position:Vector3, rotation:Vector3):
	var laser_burn = laser_burn_scene.instance()
	laser_burn.look_at(rotation * -1, Vector3.UP)
	laser_burn.translation = position
	add_child(laser_burn)