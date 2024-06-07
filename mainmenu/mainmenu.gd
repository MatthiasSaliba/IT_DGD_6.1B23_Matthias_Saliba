extends Control


func _on_button_1_pressed():
	get_tree().change_scene_to_file("res://match_and_learn/main/match_and_learn.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://3_pics_1_word/3pics1word/3pics1word.tscn")

func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://find_the_word/main.tscn")

