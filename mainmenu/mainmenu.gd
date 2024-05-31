extends Control


func _on_button_1_pressed():
	get_tree().change_scene_to_file("res://match_and_learn/main/match_and_learn.tscn")


func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://find_the_word/main.tscn")
