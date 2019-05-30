extends Spatial

var activePigeons = [] 

# Called when the node enters the scene tree for the first time.
func _ready():
	activePigeons.clear() 
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var scene = load("res://Piegon.tscn")
	var scene_instance = scene.instance()
	scene_instance.set_name("scene" + str(activePigeons.size()))
	if (activePigeons.size() < 30):
		activePigeons.append(scene_instance)
		add_child(scene_instance) 
		pass 
	pass
	
func _physics_process(delta):
	$Points.text = str(global.points)
	print(str(global.points))
	pass
