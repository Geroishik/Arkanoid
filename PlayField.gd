extends Node2D

var arrBlocks = []
var uniqLineArr = []
var blockRed = preload("res://BlockRed.tscn")
var blockYellow = preload("res://BlockYellow.tscn")
var colLine = 12
var colCollumn = 20

func coord_spawn_blocks(a, b):
	return Vector2(30 + a*60, 15 + b*30)

func _ready():
	arrBlocks.resize(colLine)
	arrBlocks.fill([])
	uniqLineArr.resize(colCollumn)
	for i in colLine:
		for j in colCollumn:
			randomize()
			match randi()%5:
				0,2:
					uniqLineArr[j] = 1
					var b = blockRed.instantiate()
					get_tree().root.add_child.call_deferred(b)
					b.position = coord_spawn_blocks(j, i)
				1,3:
					uniqLineArr[j] = 2
					var b = blockYellow.instantiate()
					get_tree().root.add_child.call_deferred(b)
					b.position = coord_spawn_blocks(j, i)
				4: 
					uniqLineArr[j] = 0
			
	
func spawn_blocks():
	pass

