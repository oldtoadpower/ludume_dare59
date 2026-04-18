extends Node2D

const POS_START: Vector2 = Vector2(120.0, 160.0)
const POS_END: Vector2 = Vector2(520.0, 160.0)

var current_signal: BaseSignal = BaseSignal.new()
var player_pos: Vector2
var path_pos: int = 0

var full_distance_viev: float

var tween_move: bool = false
var path_end: bool = false

@onready var player_sprite: Sprite2D = $player_sprite

@onready var move_button: Button = $Control/move_button
@onready var explore_button: Button = $Control/explore_button


func _ready() -> void:
	full_distance_viev = POS_END.x - POS_START.x
	player_pos = POS_START
	current_signal.generate_distance()

func _process(_delta: float) -> void:
	pass

func _on_go_button_down() -> void:
	if not tween_move and not path_end:
		print("GO")
		var step_distance = randi_range(15, 30) + Main.game_controller.player.step_bonus
		
		if step_distance > 0:
			Main.game_controller.player.water -= 1
		
		path_pos +=step_distance
		if path_pos > current_signal.distance or (current_signal.distance - path_pos) <= 5:
			path_end = true
			path_pos = current_signal.distance
		
		move_player_tween(path_pos)
		
	if path_end:
		print("PATH END")
		Main.game_controller.play_end_event_scene()

func _on_explore_button_down() -> void:
	print("EXPLORE")
	
func move_player_tween(new_position: int) -> void:
	var tween = create_tween()
	tween_move = true
	move_button.disabled = true
	
	var procent_dist = float(new_position) * 100.0 / float(current_signal.distance)
	var move_dist = procent_dist * full_distance_viev / 100.0
	
	tween.tween_property(player_sprite, 'position', Vector2(player_pos.x + move_dist, player_pos.y), 0.3)
	tween.finished.connect(func(): tween_move = false)
	tween.finished.connect(func(): move_button.disabled = false)
	tween.finished.connect(func(): tween.kill())
	tween.finished.connect(func(): event_check())
	
func event_check():
	if Main.get_chance(Main.game_controller.player.event_percent):
		print("EVENT")
		Main.game_controller.play_event_scene()
	else:
		print("NO EVENT")
		Main.game_controller.player.event_percent += 1
	
