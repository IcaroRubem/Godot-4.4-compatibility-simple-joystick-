extends Polygon2D

@export var radius = 40:
	get: return radius
	set(value): radius = value; make_circle()
	
@export var numPoints = 30:
	get: return numPoints
	set(value): numPoints = value; make_circle()

func _ready() -> void:
	make_circle()

func make_circle(): 
	var list = [] 
	const TWO_PI = PI * 2 
	for i in range(numPoints): 
		var angle = TWO_PI * i / numPoints
		var x = radius * cos(angle) 
		var y = radius * sin(angle) 
		list.append(Vector2(x, y)) 
	polygon = PackedVector2Array(list)
