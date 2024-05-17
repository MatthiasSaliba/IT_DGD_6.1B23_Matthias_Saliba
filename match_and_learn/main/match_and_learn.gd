extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_food()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawn_food():
	var food = GameManagerMatch.food_scene.instantiate()
	add_child(food)
