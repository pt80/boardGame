extends Camera2D

var zoomAmount = 1.5
@onready var SMOOTH_SPEED: float = .65

func _process(delta):
	if Input.is_action_pressed('middle_click'):
		moveCamera(delta)
	
func _input(event):
	if event.is_action_pressed("zoom in"):
		if zoom.x < 4:
			zoomAmount += .25
		zoom = Vector2(zoomAmount, zoomAmount)
		
	if event.is_action_pressed("zoom out"):
		if zoom.x > 0.25:
			zoomAmount -= .25
		zoom = Vector2(zoomAmount, zoomAmount)

func moveCamera(delta):
	var point = position + get_local_mouse_position()
	position = lerp(position, point, SMOOTH_SPEED * delta)
