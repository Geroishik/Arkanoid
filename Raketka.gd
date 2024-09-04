extends RigidBody2D

var speed = 1200
var velocity = Vector2(0, 0)
var direction = 0

func _physics_process(delta):
	velocity = Vector2(0, 0)
	var coord = get_global_mouse_position().x - position.x
	if coord > 10:
		direction = 1
	elif coord < -10:
		direction = -1
	else:
		direction = 0
	velocity = direction * speed * delta

	move_and_collide(Vector2(velocity, 0))
