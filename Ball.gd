extends RigidBody2D

var speed = 400
var ball_speed = Vector2(speed, -speed)
var stop = true

func _ready():
	await get_tree().create_timer(1).timeout
	stop = false

func _physics_process(delta):
	if not stop:
		var collision_info = move_and_collide(ball_speed * delta)
		if collision_info:
			ball_speed = ball_speed.bounce(collision_info.get_normal())

func _on_area_death_area_entered(_area):
	queue_free()
	
