extends Node

var game_controller: GameController
var event_manager: EventManager

func _ready():
	randomize()

func get_chance(persent: int) -> bool:
	return randf() < persent / 100.0
