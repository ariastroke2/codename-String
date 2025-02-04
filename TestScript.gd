extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Start")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("Update with delta: ",delta, " String concatenation")
