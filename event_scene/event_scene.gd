extends Node2D

var current_event: GameEvent

@onready var event_text: RichTextLabel = $Control/VBoxContainer/event_text

func _ready() -> void:
	current_event = Main.event_manager.events_list.pick_random()
	
	event_text.text = current_event.text

func _on_button_pressed() -> void:
	var player = Main.game_controller.player
	Main.event_manager.modify_parameter(player, current_event.parament, current_event.change_value)
	
	Main.game_controller.restore_scene()
