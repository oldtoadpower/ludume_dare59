class_name GameController
extends Node

var player =  Player

var current_scene: Node2D
var remove_scene: Node2D

@onready var display_scene: Node2D = $display_scene

func _ready() -> void:
	Main.game_controller = self
	create_run()
	change_scene("res://path_scene/path.tscn")
	
func _process(_delta: float) -> void:
	if player.hp <= 0 and not player.player_dead:
		player.player_dead = true
		print("PLAER DEAD")
		
	if player.energy <= 0 and not player.empty_energy:
		player.empty_energy = true
		print("EMPTY ENERGY!")

func create_run() -> void:
	player =  Player.new()
	
func change_scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	if current_scene != null:
		if delete:
			current_scene.queue_free()
		elif keep_running:
			current_scene.visible = false
		else:
			remove_scene = current_scene
			display_scene.remove_child(current_scene)
	
	var new = load(new_scene).instantiate()
	display_scene.call_deferred("add_child", new)
	current_scene = new
	
	print("load_scene ", current_scene.name)
	
func play_event_scene():
	change_scene("res://event_scene/event_scene.tscn", false)
	
func play_end_event_scene():
	change_scene("res://event_scene/event_scene.tscn")
	
func restore_scene() -> void:
	if remove_scene:
		current_scene.queue_free()
		display_scene.add_child(remove_scene)
		current_scene = remove_scene
