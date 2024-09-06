extends StaticBody2D

var can_destroy = true
var check_can_destroy = false
@onready var animPlayer =  $AnimationPlayer

func _ready():
	Signals.connect("can_destroy_blockBrick", Callable(self, "_can_destroy"))

func _can_destroy(arr, pos):
	var posY = (global_position.y - 15)/30
	var posX = (global_position.x - 30)/60
	if pos.x == posX:
		for i in range(posY+1, 11):
			if not (arr[i][posX] in [0, 7]):
				can_destroy = false
		if can_destroy:
				Signals.emit_signal("destroy_block", posY, posX)
				animPlayer.play("Death")
				await animPlayer.animation_finished
				queue_free()
		can_destroy = true
