extends Control

#Get button references
@onready var button1 = $Button1
@onready var button2 = $Button2
@onready var button3 = $Button3

# Called when the node enters the scene tree for the first time.
func _ready():
	button1.pressed.connect(self._button1_pressed)
	button2.pressed.connect(self._button2_pressed)
	button3.pressed.connect(self._button3_pressed)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _button1_pressed():
	#get_tree().change_scene("res://match_and_learn/match_and_learn.tscn")
	var scene1_instance = GameManager.match_and_learn_scene.instantiate()
	add_child(scene1_instance)
	#TODO CHANGE SCENE INSTEAD

func _button2_pressed():
	#TODO: LOAD 3 Pics 1 Word
	pass

func _button3_pressed():
	#TODO: LOAD Find the Word
	pass
	
	
