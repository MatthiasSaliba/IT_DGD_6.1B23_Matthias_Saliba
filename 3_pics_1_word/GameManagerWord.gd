extends Node

var object_pool = [
	{"image": "res://images/biscuits/biscuit1.png", "image1": "res://images/biscuits/biscuit2.png", "image2": "res://images/biscuits/biscuit3.png", "word": "BISCUITS"}, 
	{"image": "res://images/book/book1.png", "image1": "res://images/book/book2.png", "image2": "res://images/book/book3.png", "word": "BOOK"},
	{"image": "res://images/chair/chair1.png", "image1": "res://images/chair/chair2.png", "image2": "res://images/chair/chair2.png", "word": "CHAIR"},
	{"image": "res://images/dice/dice1.png", "image1": "res://images/dice/dice2.png", "image2": "res://images/dice/dice3.png", "word": "DICE"}, 
	{"image": "res://images/bottle/bottle1.png", "image1": "res://images/bottle/bottle2.png", "image2": "res://images/bottle/bottle3.png", "word": "BOTTLE"},
	{"image": "res://images/phone/phone1.png", "image1": "res://images/phone/phone2.png", "image2": "res://images/phone/phone3.png", "word": "PHONE"}
]

#touch event
var isDragging = false

var item =  object_pool[5] #object_pool[randi() % object_pool.size()]
var item2 = object_pool[randi() % object_pool.size()]
var item3 = object_pool[randi() % object_pool.size()]

var correctPlacements = []

