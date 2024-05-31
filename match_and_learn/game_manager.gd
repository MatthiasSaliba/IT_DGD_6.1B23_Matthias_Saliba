extends Node

#loading food textures
var food_textures = [
	preload("res://images/apple.png"),
	preload("res://images/banana.png"),
	preload("res://images/bread.png"),
	preload("res://images/burger.png"),
	preload("res://images/carrot.png"),
	preload("res://images/cheese.png"),
	preload("res://images/french_fries.png"),
	preload("res://images/grapes_purple.png"),
	preload("res://images/lemon.png"),
	preload("res://images/orange.png")
]

var object_pool = [
	{"image": "res://images/apple.png", "word": "APPLE"}, 
	{"image": "res://images/banana.png", "word": "BANANA"},
	{"image": "res://images/bread.png", "word": "BREAD"},
	{"image": "res://images/burger.png", "word": "BURGER"}, 
	{"image": "res://images/carrot.png", "word": "CARROT"},
	{"image": "res://images/cheese.png", "word": "CHEESE"},
	{"image": "res://images/french_fries.png", "word": "FRIES"},
	{"image": "res://images/grapes_purple.png", "word": "GRAPES"},
	{"image": "res://images/lemon.png", "word": "LEMON"},
	{"image": "res://images/orange.png", "word": "ORANGE"}
]

#touch event
var isDragging = false

var item = object_pool[randi() % object_pool.size()]
var item2 = object_pool[randi() % object_pool.size()]
var item3 = object_pool[randi() % object_pool.size()]
var item4 = object_pool[randi() % object_pool.size()]

var correctPlacements = []
var matchandlearn = load("res://match_and_learn/main/match_and_learn.tscn").instantiate()



#progress bar
var progress = 0
var progress_max = item.size()
var progress_max2 = item2.size()
var progress_max3 = item3.size()
var progress_max4 = item4.size()

func pick_random_texture() -> Texture:
	var random_index = randi() % food_textures.size()
	return food_textures[random_index]
	
