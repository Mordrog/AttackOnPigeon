extends RichTextLabel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ms = 0
var s = 0
var m = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if ms > 59:
		s += 1
		ms = 0
	
	if s > 59:
		m += 1
		s = 0
		
	set_text(str(m) + ":" + str(s) + ":" + str(ms)) 
	pass
	    
func _on_Timer_timeout():
	ms += 1 
	pass # Replace with function body.
