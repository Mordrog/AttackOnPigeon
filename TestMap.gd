extends Spatial

var activePigeons = [] 

# Called when the node enters the scene tree for the first time.
func _ready():
	activePigeons.clear() 
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var scene = load("res://EnemyPiegon.tscn")
	var scene_instance = scene.instance()
	scene_instance.set_name("scene" + str(activePigeons.size()))
	scene_instance.set_player($Player)

	if (activePigeons.size() < 50):
		activePigeons.append(scene_instance)
		scene_instance.set_translation(Vector3(rand_range(-40,40),1.4,rand_range(-40,40)))
		add_child(scene_instance) 
		pass 
	pass
	
func _physics_process(delta):
	$Points.text = str(global.points) 
	pass
