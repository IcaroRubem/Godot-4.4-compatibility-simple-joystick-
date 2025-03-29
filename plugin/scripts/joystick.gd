extends Control

@onready var bigCircle = $BigCircle
@onready var smallCircle = $SmallCircle
@onready var maxRadius = $BigCircle.radius
@onready var wD2 = get_tree().root.size.x

var is_pressed = false

signal joystick_move(direction: Vector2, angle: float)
signal joystick_pressed(state: bool)




func _process(delta: float) -> void:
	if not is_pressed:
		smallCircle.global_position = smallCircle.global_position.lerp(bigCircle.global_position, 0.3)

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.is_pressed() and event.position.x < wD2 / 2.0:
			is_pressed = true
		else:
			is_pressed = false
			
		emit_signal("joystick_pressed", is_pressed)
	if is_pressed and (event is InputEventScreenDrag or event is InputEventScreenTouch):
		var direction = (event.position - bigCircle.global_position).normalized()
		var angle = bigCircle.global_position.angle_to_point(smallCircle.global_position)
		smallCircle.global_position = bigCircle.global_position + direction * maxRadius
		
		emit_signal("joystick_move", direction, angle)
		
		
		
		
		
		
		
		
		
		
		
		
		
