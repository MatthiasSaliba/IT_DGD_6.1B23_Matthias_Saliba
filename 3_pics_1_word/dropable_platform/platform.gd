extends StaticBody2D

@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(Color.GRAY, 0.7)
	label.add_theme_color_override("font_color", Color("Black"))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameManagerWord.isDragging:
		visible = true
		label.visible = false
	else:
		visible = true
		label.visible = false
