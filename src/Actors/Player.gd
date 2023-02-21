extends Actor

var motion = Vector2()

func _physics_process(delta: float):
	var inputVector = Vector2()
	inputVector.x += speed
	
	
	if Input.is_action_just_pressed("ui_up"):
		motion.y -= upSpeed
	
	if Input.is_action_just_pressed("ui_down"):
		motion.y += upSpeed
	
	
	
	motion = move_and_slide(inputVector)
