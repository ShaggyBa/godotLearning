extends Actor

var motion = Vector2()

var viewportSize : Vector2

signal onPlayerHit 

func _ready() -> void:
	viewportSize = get_viewport().size

func _physics_process(delta: float):
	var inputVector = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		inputVector.y -= upSpeed
	
	if Input.is_action_pressed("ui_down"):
		inputVector.y += upSpeed
	
	if Input.is_action_pressed("ui_left"):
		inputVector.x -= upSpeed
	
	if Input.is_action_pressed("ui_right"):
		inputVector.x += upSpeed
	
	
	position.y = clamp(position.y, 0, viewportSize.y)
	
	motion = move_and_slide(inputVector)

func _process(delta: float) -> void:
	PlayerCollisions()	

func PlayerCollisions():
	for i in range(get_slide_count()):
		if get_slide_collision(i).collider.has_signal("enemy"):
			emit_signal("onPlayerHit")

func _on_Player_onPlayerHit() -> void:
	queue_free()
	get_tree().reload_current_scene()
