extends Control

# Define the grid size
const GRID_SIZE = 6

# Define the word to hide
const WORD_TO_HIDE = "GODOT"

# Array of uppercase letters
var uppercase_letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

# Array of letters
var letters = []

#Grid properties
var label_size = Vector2(50, 50)

# Selected letter color
var selected_color = Color(1, 0, 0) # Red color

var selected_label = null

# Variable to keep track of the discovered word
var discovered_word = ""

func _ready():
	# Initialize the grid with random letters
	initializeGrid()
	
	# Hide the word in the grid
	hideWord()

func initializeGrid():
	letters.clear()
	
	# Generate random letters for the grid
	for x in range(GRID_SIZE):
		var row = []
		for y in range(GRID_SIZE):
			var letter = uppercase_letters[randi() % uppercase_letters.length()] # Generates a random uppercase letter
			row.append(letter)
		letters.append(row)

	# Display the grid
	for x in range(GRID_SIZE):
		for y in range(GRID_SIZE):
			var label = Label.new()
			label.text = letters[x][y]
			add_child(label)
			label.size = Vector2(50, 50) # Set the size of the Label
			label.position = Vector2(x * 60, y * 60)

func hideWord():
	# Randomly select a position for the word
	var startX = randi() % (GRID_SIZE - WORD_TO_HIDE.length() + 1)
	var startY = randi() % GRID_SIZE

	# Hide the word horizontally
	for i in range(WORD_TO_HIDE.length()):
		letters[startX + i][startY] = WORD_TO_HIDE[i]

	# Update the labels to display the hidden word
	for x in range(GRID_SIZE):
		for y in range(GRID_SIZE):
			var label = get_child(x * GRID_SIZE + y)
			label.text = letters[x][y]

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		# Check if a label was clicked
		if event.button_index == MOUSE_BUTTON_LEFT:
			var label_position = event.position
			for child in get_children():
				if child is Label:
					var label_rect = Rect2(child.position, child.size)
					if label_rect.has_point(label_position):
						var clicked_label = child
						# Check if the clicked label is the same as the selected label
						if clicked_label.text in discovered_word:
							print("This letter is already discovered.")
						else:
							# Add the clicked letter to discovered word
							discovered_word += clicked_label.text
							# Change color of the clicked label
							clicked_label.modulate = selected_color
							# Check if the discovered word matches the hidden word
							if discovered_word == WORD_TO_HIDE:
								print("Congratulations! You found the word:", WORD_TO_HIDE)

func checkWord():
	var found_letters = []
	var found_word = true

	# Check if each letter of the hidden word has been found
	for letter in WORD_TO_HIDE:
		if letter in found_letters:
			continue  # If the letter has already been found, skip it
		if letter not in letters:
			found_word = false
			break
		found_letters.append(letter)
	
	print(found_letters)
	
	if found_word:
		print("Congratulations! You found the word:", WORD_TO_HIDE)
	else:
		print("Keep searching!")

func _process(delta):
	# Update grid size and label size to make it responsive
	var screen_size = get_viewport_rect().size
	var label_width = screen_size.x / GRID_SIZE
	var label_height = screen_size.y / GRID_SIZE
	label_size = Vector2(label_width, label_height)
	for child in get_children():
		if child is Label:
			child.size = label_size
