class_name GameController
extends Node

var player =  Player
var params = Global_param

@onready var current_scene: Node2D = $current_scene

func _ready() -> void:
	Main.game_controller = self
	create_run()
	
func _process(_delta: float) -> void:
	if player.hp <= 0 and not player.player_dead:
		player.player_dead = true
		print("PLAER DEAD")
		
	if params.energy <= 0 and not params.empty_energy:
		params.empty_energy = true
		print("EMPTY ENERGY!")

func create_run() -> void:
	player =  Player.new()
	params = Global_param.new()
