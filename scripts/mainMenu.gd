extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/characterSelect.tscn")


func _on_options_pressed():
	print('show me you options')


func _on_exit_pressed():
	get_tree().quit()
