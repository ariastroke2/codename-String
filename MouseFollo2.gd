extends RigidBody2D

var pressed : bool = false
var shootQueued: bool = false
var test = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed = false;
	shootQueued = false;
	freeze_mode = FREEZE_MODE_KINEMATIC


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if pressed:
		var target_pos = get_global_mouse_position()
		var force = (target_pos - global_position).normalized() * 500  # Adjust multiplier as needed
		apply_force(force)
		
	if shootQueued:
		shootQueued = false;
		var target_pos = get_global_mouse_position()
		var force = -(target_pos - global_position).normalized() * 250000  # Adjust multiplier as needed
		apply_force(force)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			pressed = event.pressed
			if !pressed:
				shootQueued = true;
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			print("Wheel down")
