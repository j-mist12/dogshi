extends Node2D

@onready var player= $Player
var enemy_2D = preload("res://enemy.tscn")
var round = 1
@onready var world = $world
func round_up():
	if get_tree().get_nodes_in_group("enemies").is_empty():
		round+= 1
		spawn_enemies()
func _process(delta):
	round_up()
func _ready():
	randomize()
	spawn_enemies()


func spawn_enemies():
	for i in range(round):
		var e = enemy_2D.instantiate()
		world.add_child(e)
		e.player = $Player
		print(e.global_position)
		e.global_position = Vector2(randf_range(100,500),randf_range(100,300))
func quit():
	get_tree().quit()
