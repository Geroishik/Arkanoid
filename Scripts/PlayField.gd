extends Node2D

var arrBlocks = []
var uniqLineArr = []
var blockRed = preload("res://Scenes/BlockRed.tscn")
var blockYellow = preload("res://Scenes/BlockYellow.tscn")
var blockPurple = preload("res://Scenes/BlockPurple.tscn")
var blockGreen = preload("res://Scenes/BlockGreen.tscn")
var blockBlue = preload("res://Scenes/BlockBlue.tscn")
var blockOrange = preload("res://Scenes/BlockOrange.tscn")
var blockBrick1 = preload("res://Scenes/BlockBrick1.tscn")

var colLine = 12
var colCollumn = 20
var arrBlockNumb = [1, 2, 3, 4, 5, 6]

func coord_spawn_blocks(a, b):
	return Vector2(30 + a*60, 15 + b*30)

func _ready():
	Signals.connect("position_blocks", Callable(self, "_get_position_destroy_block"))
	Signals.connect("destroy_block", Callable(self, "_block_is_destroy"))
	spawn_blocks()
	
func _block_is_destroy(posY, posX):
	arrBlocks[posY][posX] = 0
	

func _get_position_destroy_block(pos):
	var pos_destroy_block = Vector2((pos.x-30)/60, (pos.y-15)/30)
	if arrBlocks[pos_destroy_block.y][pos_destroy_block.x] in arrBlockNumb:
		arrBlocks[pos_destroy_block.y][pos_destroy_block.x] = 0
		Signals.emit_signal("can_destroy_blockBrick", arrBlocks, pos_destroy_block)

func spawn_blocks():
	arrBlocks.resize(colLine)
	uniqLineArr.resize(colCollumn)
	for i in colLine-1:
		for j in colCollumn:
			randomize()
			match randi()%16:
				0,1:
					var b = blockRed.instantiate()
					uniqLineArr[j] = 1
					get_tree().root.add_child.call_deferred(b)
					b.position = coord_spawn_blocks(j, i)
				2,3:
					var b = blockYellow.instantiate()
					uniqLineArr[j] = 2
					get_tree().root.add_child.call_deferred(b)
					b.position = coord_spawn_blocks(j, i)
				4,5:
					var b = blockPurple.instantiate()
					uniqLineArr[j] = 3
					get_tree().root.add_child.call_deferred(b)
					b.position = coord_spawn_blocks(j, i)
				6,7:
					var b = blockGreen.instantiate()
					uniqLineArr[j] = 4
					get_tree().root.add_child.call_deferred(b)
					b.position = coord_spawn_blocks(j, i)
				8,9:
					var b = blockBlue.instantiate()
					uniqLineArr[j] = 5
					get_tree().root.add_child.call_deferred(b)
					b.position = coord_spawn_blocks(j, i)
				10,11:
					var b = blockOrange.instantiate()
					uniqLineArr[j] = 6
					get_tree().root.add_child.call_deferred(b)
					b.position = coord_spawn_blocks(j, i)	
				12,13,14,15: 
					var b = blockBrick1.instantiate()
					uniqLineArr[j] = 7
					get_tree().root.add_child.call_deferred(b)
					b.position = coord_spawn_blocks(j, i)	
					
		arrBlocks[i] = uniqLineArr.duplicate(true)	
		
	for k in colCollumn:
		randomize()
		match randi()%12:
			0,1:
				var b = blockRed.instantiate()
				uniqLineArr[k] = 1
				get_tree().root.add_child.call_deferred(b)
				b.position = coord_spawn_blocks(k, colLine-1)
			2,3:
				var b = blockYellow.instantiate()
				uniqLineArr[k] = 2
				get_tree().root.add_child.call_deferred(b)
				b.position = coord_spawn_blocks(k, colLine-1)
			4,5:
				var b = blockPurple.instantiate()
				uniqLineArr[k] = 3
				get_tree().root.add_child.call_deferred(b)
				b.position = coord_spawn_blocks(k, colLine-1)
			6,7:
				var b = blockGreen.instantiate()
				uniqLineArr[k] = 4
				get_tree().root.add_child.call_deferred(b)
				b.position = coord_spawn_blocks(k, colLine-1)
			8,9:
				var b = blockBlue.instantiate()
				uniqLineArr[k] = 5
				get_tree().root.add_child.call_deferred(b)
				b.position = coord_spawn_blocks(k, colLine-1)
			10,11:
				var b = blockOrange.instantiate()
				uniqLineArr[k] = 6
				get_tree().root.add_child.call_deferred(b)
				b.position = coord_spawn_blocks(k, colLine-1)	
	arrBlocks[colLine - 1] = uniqLineArr.duplicate(true)
