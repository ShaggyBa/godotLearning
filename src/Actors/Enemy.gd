extends Actor

var motion = Vector2()

func _physics_process(delta: float):
	var inputVector = Vector2()
	inputVector.x -= speed
	
	motion = move_and_slide(inputVector)


