extends ImmediateGeometry

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	begin(Mesh.PRIMITIVE_LINES)
	add_vertex(Vector3(0, 0, 0))
	add_vertex(Vector3(0, 0, 10))
	end()