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

#loading food scenes
var food_scene = preload("res://match_and_learn/food/food.tscn")


func pick_random_texture() -> Texture:
	var random_index = randi() % food_textures.size()
	return food_textures[random_index]
	
