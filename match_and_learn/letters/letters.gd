class_name Letters
extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos : Vector2

@onready var label = $Label
@onready var bg = $Sprite2D

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
				print(label.text)
				var reference = body_ref.get_node("Label").text
				if label.text == reference:
					modulate = Color(Color.GREEN, 1)
					#body_ref.modulate = Color(Color.WHITE, 0)
				else:
					tween.tween_property(self, "position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
					#modulate = Color(Color.RED, 1)
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
