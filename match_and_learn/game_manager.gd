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

#loading food scenes
var food_scene = preload("res://match_and_learn/food/food.tscn")


func pick_random_texture() -> Texture:
	var random_index = randi() % food_textures.size()
	return food_textures[random_index]
	
