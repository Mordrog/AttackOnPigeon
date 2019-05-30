extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	$"G".set("custom_colors/font_color", Color(1, 0, 0, lerp($"G".get("custom_colors/font_color").a, 1, 0.01)))
	$"A".set("custom_colors/font_color", Color(1, 0, 0, lerp($"A".get("custom_colors/font_color").a, 1, 0.0095)))
	$"M".set("custom_colors/font_color", Color(1, 0, 0, lerp($"M".get("custom_colors/font_color").a, 1, 0.009)))
	$"E".set("custom_colors/font_color", Color(1, 0, 0, lerp($"E".get("custom_colors/font_color").a, 1, 0.0085)))
	$"O".set("custom_colors/font_color", Color(1, 0, 0, lerp($"O".get("custom_colors/font_color").a, 1, 0.008)))
	$"V".set("custom_colors/font_color", Color(1, 0, 0, lerp($"V".get("custom_colors/font_color").a, 1, 0.0075)))
	$"E2".set("custom_colors/font_color", Color(1, 0, 0, lerp($"E2".get("custom_colors/font_color").a, 1, 0.007)))
	$"R".set("custom_colors/font_color", Color(1, 0, 0, lerp($"R".get("custom_colors/font_color").a, 1, 0.0065)))
	