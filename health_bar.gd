extends HBoxContainer

export(Gradient) var health_gradient
export(PackedScene) var health_point

export var health = 0
export(float) var max_health = 16

func _ready():
	health = max_health
	setup_health()
	pass # Replace with function body.

func setup_health():
	for i in range(max_health):
		add_child(health_point.instance())
		
	update_color()
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		remove_health()
	pass

func remove_health():
	if get_child_count() > 0:
		get_child(get_child_count() -1).queue_free()
		
	pass

func update_color():
	for i in get_children():
		i.modulate = health_gradient.interpolate(float(i.get_index() / max_health))
	pass
