extends Node2D


func _on_signal_button_pressed() -> void:
	Main.game_controller.play_path_scene()
