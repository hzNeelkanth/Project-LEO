extends CharacterBody3D

@export var max_speed: float = 200.0
@export var min_speed: float = 40.0
@export var acceleration: float = 125.5
@export var turn_speed: float = 1.322

var current_speed: float = 40.0

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("TUP"):
		current_speed = move_toward(current_speed, max_speed, acceleration * delta)
	elif Input.is_action_pressed("TDOWN"):
		current_speed = move_toward( current_speed, min_speed, acceleration * delta)
	var pitch_input = Input.get_axis("PDOWN", "PUP")
	var roll_input = Input.get_axis("RRIGHT", "RLEFT")
	var yaw_input = Input.get_axis("YRIGHT", "YLEFT")

	rotate_object_local(Vector3.RIGHT, pitch_input * turn_speed * delta)
	rotate_object_local(Vector3.FORWARD, roll_input * turn_speed * delta)
	rotate_object_local(Vector3.UP, yaw_input * turn_speed * 0.5 * delta)

	velocity = -global_transform.basis.z * current_speed
	move_and_slide()
