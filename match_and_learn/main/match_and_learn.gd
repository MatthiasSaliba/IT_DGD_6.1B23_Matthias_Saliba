extends Node2D

var item = GameManagerMatch.object_pool[randi() % GameManagerMatch.object_pool.size()]
var platform = load("res://match_and_learn/dropable_platform/platform.tscn")
var letterLabel = load("res://match_and_learn/letters/letters.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	start_new_round()
	
func start_new_round():	
	# Extract letters from the word and shuffle them
	var shuffledLetters = shuffleWord(item["word"])

	# Display shuffled letters around the image and word
	displayLetters(shuffledLetters)
	#displayPlatforms(shuffledLetters)
	displayFood()
	
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

func unshuffleWord(word):
	var originalLetters = item["word"]
	return originalLetters

func displayLetters(letters):
	var posX = 350
	var posY : int = 400
	var word = item["word"].split("")
	# Display the shuffled letters around the image and word
	for i in range(letters.size()):
		var letterLabels = letterLabel.instantiate()
		#var instance = letterLabel.instantiate()
		letterLabels.position = Vector2(randf_range(100, 900), randf_range(100, 550))
		var label = letterLabels.get_node("Label")
		label.text = letters[i]
		label.z_index = 1
		label.add_theme_color_override("font_color", Color("Black"))
		add_child(letterLabels)
		
		var platforms = platform.instantiate()
		platforms.position = Vector2(posX,posY)
		var platformLabel = platforms.get_node("Label")
		platforms.z_index = 0
		platformLabel.text = word[i]
		posX += 100
		add_child(platforms)

func _process(delta):
	pass

func displayFood():
	# Load and display the image
	var imageSprite = Sprite2D.new()
	imageSprite.texture = load(item["image"])
	imageSprite.position = Vector2(576,324)
	imageSprite.scale = Vector2(2,2)
	add_child(imageSprite)
