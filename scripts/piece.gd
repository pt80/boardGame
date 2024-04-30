extends Node2D

var player


func _process(delta):
	if !GameManager.holdingPiece:
		if Input.is_action_pressed("click") && !GameManager.holdingPiece:
			GameManager.holdingPiece = true
			GameManager.currentPiece.global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			print('stipoopoopopo')
			GameManager.holdingPiece = false

func _on_area_2d_mouse_entered():
	print('youre on me')
	GameManager.currentPiece = self
	print(GameManager.currentPiece)


func _on_area_2d_mouse_exited():
	pass # Replace with function body.
