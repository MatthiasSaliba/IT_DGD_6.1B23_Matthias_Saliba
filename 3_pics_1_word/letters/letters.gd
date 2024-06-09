extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos : Vector2

@onready var label = $Label
@onready var bg = $Sprite2D

#i need to get an instance of the progress bar from 3pics1word scene
@onready var progressBar = get_node("/root/3Pics1Word/ProgressBar")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			GameManagerWord.isDragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			GameManagerWord.isDragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
				var reference = body_ref.get_node("Label").text
				
				if label.text == reference:
					GameManagerWord.correctPlacements.append(reference)
					
					print(GameManagerWord.correctPlacements)
					#increment progressbar
					get_tree().call_group("3Pics1Word", "_on_increment_progressbar")
					print(progressBar.value)

					if checkWordCompletion() || checkWordCompletion2() || checkWordCompletion3():
						# clear the correct placements
						GameManagerWord.correctPlacements.clear()
						progressBar.value = 0
						modulate = Color(Color.GREEN, 1)
						print("correct word")
						await get_tree().create_timer(2).timeout
						get_tree().call_group("3Pics1Word", "_on_correct_match")
						
				else:
					tween.tween_property(self, "position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "position", initialPos, 0.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable1'):
		is_inside_dropable = true
		body.modulate = Color(Color.GRAY, 0.8)
		body_ref = body
		print("enteredbody")


func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable1'):
		is_inside_dropable = false
		body.modulate = Color(Color.LIGHT_GRAY, 0.7)
		print("exitedbody")


func _on_area_2d_mouse_entered():
	if not GameManagerWord.isDragging:
		draggable = true
		scale = Vector2(1.05, 1.05)
		print("enteredmouse")


func _on_area_2d_mouse_exited():
	if not GameManagerWord.isDragging:
		draggable = false
		scale = Vector2(1,1)
		print("exitedmouse")

func checkWordCompletion():
	var word = GameManagerWord.item["word"].split("")
	if len(word) != GameManagerWord.correctPlacements.size():
		return false
	for letter in word:
		if not GameManagerWord.correctPlacements.has(letter):
			return false
	return true


func checkWordCompletion2():
	var word = GameManagerWord.item2["word"].split("")
	if len(word) != GameManagerWord.correctPlacements.size():
		return false
	for letter in word:
		if not GameManagerWord.correctPlacements.has(letter):
			return false
	return true

func checkWordCompletion3():
	var word = GameManagerWord.item3["word"].split("")
	if len(word) != GameManagerWord.correctPlacements.size():
		return false
	for letter in word:
		if not GameManagerWord.correctPlacements.has(letter):
			return false
	return true