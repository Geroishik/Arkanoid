extends StaticBody2D

@onready var anim = $AnimatedSprite2D

func _on_area_2d_body_entered(_body):
	$CollisionShape2D.set_deferred("disabled", true)
	anim.play("Death")
	await anim.animation_finished
	queue_free()
