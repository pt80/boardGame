extends Control


func _on_play_pressed():
	print('yo DJ play dat shit')
	get_tree().change_scene_to_file("res://scenes/characterSelect.tscn")


func _on_options_pressed():
	print('show me you options')


func _on_exit_pressed():
	print('bye btye')
	get_tree().quit()
