extends Node2D

var game_controller: GameController
var event_manager: EventManager
var inventory_controller: InventoryController

func _ready():
	randomize()

func get_chance(persent: int) -> bool:
	return randf() < persent / 100.0
