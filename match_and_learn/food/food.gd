extends Node2D



func _ready():
	#sprite.texture = texture
	startNewRound()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func startNewRound():
	# Select a random item from the array
	#var item = imageWords[randi() % imageWords.size()]
	var item = GameManagerMatch.object_pool[randi() % GameManagerMatch.object_pool.size()]

	# Load and display the image
	var imageSprite = Sprite2D.new()
	imageSprite.texture = load(item["image"])
	imageSprite.position = Vector2(576,324)
	imageSprite.scale = Vector2(2,2)
	add_child(imageSprite)

	# Display the associated word
	var wordLabel = Label.new()
	wordLabel.text = item["word"]
	wordLabel.position = Vector2(570, 400) # Adjust position as needed
	wordLabel.add_theme_color_override("font_color", Color("gray"))
	add_child(wordLabel)

	# Extract letters from the word and shuffle them
	var shuffledLetters = shuffleWord(item["word"])

	# Display shuffled letters around the image and word
	displayLetters(shuffledLetters)
	
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
	
func displayLetters(letters):
	# Display the shuffled letters around the image and word
	for i in range(letters.size()):
		var letterLabel = Label.new()
		letterLabel.text = letters[i]
		letterLabel.position = Vector2(randf_range(50, 300), randf_range(50, 300)) # Adjust position as needed
		add_child(letterLabel)
