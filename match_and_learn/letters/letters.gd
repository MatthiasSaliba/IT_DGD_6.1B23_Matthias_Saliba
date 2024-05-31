class_name Letters
extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos : Vector2

@onready var label = $Label
@onready var bg = $Sprite2D

#i need to get an instance of the progress bar from matchandlearn scene
@onready var progressBar = get_node("/root/MatchAndLearn/ProgressBar")

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			GameManagerMatch.isDragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			GameManagerMatch.isDragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self, "position", body_ref.position, 0.2).set_ease(Tween.EASE_OUT)
				var reference = body_ref.get_node("Label").text
				if label.text == reference:
					GameManagerMatch.correctPlacements.append(reference)
					modulate = Color(Color.GREEN, 1)
					print(GameManagerMatch.correctPlacements)
					#increment progressbar
					get_tree().call_group("main", "_on_increment_progressbar")
					print(progressBar.value)
					
					if checkWordCompletion() || checkWordCompletion2() || checkWordCompletion3() || checkWordCompletion4():
						get_tree().call_group("main", "_on_correct_match")
						# clear the correct placements
						GameManagerMatch.correctPlacements.clear()
						progressBar.value = 0
						
				else:
					tween.tween_property(self, "position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self, "position", initialPos, 0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_mouse_entered():
	if not GameManagerMatch.isDragging:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not GameManagerMatch.isDragging:
		draggable = false
		scale = Vector2(1,1)

func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 0.8)
		body_ref = body

func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)

# Check Completion
func checkWordCompletion():
	var word = GameManagerMatch.item["word"].split("")
	for letter in word:
		if not GameManagerMatch.correctPlacements.has(letter):
			return false
	return true

func checkWordCompletion2():
	var word = GameManagerMatch.item2["word"].split("")
	for letter in word:
		if not GameManagerMatch.correctPlacements.has(letter):
			return false
	return true

func checkWordCompletion3():
	var word = GameManagerMatch.item3["word"].split("")
	for letter in word:
		if not GameManagerMatch.correctPlacements.has(letter):
			return false
	return true

func checkWordCompletion4():
	var word = GameManagerMatch.item4["word"].split("")
	for letter in word:
		if not GameManagerMatch.correctPlacements.has(letter):
			return false
	return true

