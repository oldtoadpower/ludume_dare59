class_name EventManager
extends Node2D

@export var events_list : Array[GameEvent] = []

var current_event: GameEvent

signal event_triggered(event_text: String)

func _ready() -> void:
	Main.event_manager = self

func trigger_random_event(target: Node) -> GameEvent:
	if events_list.is_empty():
		return null
	
	var random_event = events_list.pick_random()
	random_event.apply_event(target)
	event_triggered.emit(random_event.event_text)
	return random_event
	
func modify_parameter(player_run: Player, param_name: String, value: int) -> void:
	match param_name:
		"hp":
			player_run.hp += value
		"money":
			player_run.money += value
		"energy":
			player_run.energy += value
		"water":
			player_run.water += value
		"karma":
			player_run.karma += value
		"ammo":
			player_run.ammo += value
		"med":
			player_run.med += value
		"event_percent":
			player_run.event_percent += value
	
	print("Параметр '%s' изменён на %d" % [param_name, value])
