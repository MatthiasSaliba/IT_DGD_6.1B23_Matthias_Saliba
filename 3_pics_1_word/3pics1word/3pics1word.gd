extends Node2D

var platform = load("res://3_pics_1_word/dropable_platform/platform.tscn")
var letterLabel = load("res://3_pics_1_word/letters/letters.tscn")

@onready var background = $BG
@onready var button = $Button
@onready var progressBar = $ProgressBar
@onready var hint = $Hint

# Called when the node enters the scene tree for the first time.
func _ready():
	start_new_round()
 

#increment progressbar according round
func _on_increment_progressbar():
	if currentRound == 1:
		progressBar.value += (100/GameManagerWord.item["word"].length())
	elif currentRound == 2:
		progressBar.value += (100/GameManagerWord.item2["word"].length())
	elif currentRound == 3:
		progressBar.value += (100/GameManagerWord.item3["word"].length())

func _on_correct_match():
	incrementRound()
	if currentRound > MAX_ROUNDS:
		print("Level complete")
		get_tree().change_scene_to_file("res://match_and_learn/level_complete/level_complete.tscn")
	else:
		start_new_round()

func _on_button_pressed():
	for child in get_children():
		child.queue_free()
	get_tree().change_scene_to_file("res://mainmenu/mainmenu.tscn")
	GameManagerWord.correctPlacements.clear()
	
var currentRound = 1
const MAX_ROUNDS = 3

func start_new_round():
	print(currentRound)

	background.z_index = 0

	for child in get_children():
		if child != background and child != button and child != progressBar:
			child.queue_free()

	var shuffledLetters = shuffleWord(GameManagerWord.item["word"])
	var shuffledLetters2 = shuffleWord(GameManagerWord.item2["word"])
	var shuffledLetters3 = shuffleWord(GameManagerWord.item3["word"])
	var imageSprite1 = Sprite2D.new()
	var imageSprite2 = Sprite2D.new()
	var imageSprite3 = Sprite2D.new()
	
	if currentRound == 1:
		displayLetters1(shuffledLetters)
		imageSprite1.texture = load(GameManagerWord.item["image"])
		imageSprite2.texture = load(GameManagerWord.item["image1"])
		imageSprite3.texture = load(GameManagerWord.item["image2"])
	elif currentRound == 2:
		displayLetters2(shuffledLetters2)
		imageSprite1.texture = load(GameManagerWord.item2["image"])
		imageSprite2.texture = load(GameManagerWord.item2["image1"])
		imageSprite3.texture = load(GameManagerWord.item2["image2"])
	elif currentRound == 3:
		displayLetters3(shuffledLetters3)
		imageSprite1.texture = load(GameManagerWord.item3["image"])
		imageSprite2.texture = load(GameManagerWord.item3["image1"])
		imageSprite3.texture = load(GameManagerWord.item3["image2"])
	
	imageSprite1.position = Vector2(376, 324)
	imageSprite1.scale = Vector2(2, 2)
	imageSprite1.z_index = 1
	imageSprite2.position = Vector2(576, 324)
	imageSprite2.scale = Vector2(2, 2)
	imageSprite2.z_index = 1
	imageSprite3.position = Vector2(776, 324)
	imageSprite3.scale = Vector2(2, 2)
	imageSprite3.z_index = 1
	add_child(imageSprite1)
	add_child(imageSprite2)
	add_child(imageSprite3)

func incrementRound():
	currentRound += 1

func displayLetters(letters, word):
	var posX = 350
	var posY = 450
	
	for i in range(letters.size()):
		var letterLabels = letterLabel.instantiate()
		letterLabels.position = Vector2(randf_range(100, 900), randf_range(100, 550))
		var label = letterLabels.get_node("Label")
		label.text = letters[i]
		letterLabels.z_index = 3
		label.add_theme_color_override("font_color", Color("Black"))
		add_child(letterLabels)
		
		var platforms = platform.instantiate()
		platforms.position = Vector2(posX, posY)
		platforms.z_index = 2
		var platformLabel = platforms.get_node("Label")
		platformLabel.text = word[i]
		posX += 100
		add_child(platforms)

func displayLetters1(letters):
	var word = GameManagerWord.item["word"].split("")
	displayLetters(letters, word)

func displayLetters2(letters):
	var word = GameManagerWord.item2["word"].split("")
	displayLetters(letters, word)
		
func displayLetters3(letters):
	var word = GameManagerWord.item3["word"].split("")
	displayLetters(letters, word)

func shuffleWord(word):
	# Convert word to an array of characters
	var letters = word.split("")

	# Shuffle the letters using Fisher-Yates algorithm
	for i in range(letters.size() - 1, 0, -1):
		var j = randi_range(0, i)
		var temp = letters[i]
		letters[i] = letters[j]
		letters[j] = temp

	return letters

# i need to get an instance of the label from the platform scene

func _on_button_2_pressed():
	#platformLabel.visible = true
	print("button pressed")
