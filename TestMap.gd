extends Spatial
 
var seconds = 0
var activePigeons = [] 

# Called when the node enters the scene tree for the first time.
func _ready():
	activePigeons.clear() 
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (activePigeons.size() < 400 && seconds == 2):
		var scene = load("res://EnemyPiegon.tscn")
		var scene_instance = scene.instance()
		scene_instance.set_name("scene" + str(activePigeons.size()))
		scene_instance.set_player($Player)

		if (activePigeons.size() < 50):
			activePigeons.append(scene_instance)
			scene_instance.set_translation(Vector3(rand_range(-40,40),1.4,rand_range(-40,40)))
			add_child(scene_instance)
			seconds = 0 
			pass 
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
