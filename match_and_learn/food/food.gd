extends Node2D

@onready var sprite = $Sprite2D

#Visual
var texture: Texture

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.texture = texture
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
