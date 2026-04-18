extends Node2D

const POS_START: Vector2 = Vector2(120.0, 160.0)
const POS_END: Vector2 = Vector2(520.0, 160.0)

var current_signal: BaseSignal = BaseSignal.new()
var player_pos: Vector2
var path_pos: int = 0

var tween_move: bool = false
var path_end: bool = false

@onready var player_sprite: Sprite2D = $player_sprite


func _ready() -> void:
	player_pos = POS_START
	current_signal.generate_distance()

func _process(delta: float) -> void:
	pass

func _on_go_button_down() -> void:
	if not tween_move and not path_end:
		var step_distance = randi_range(15, 30)
		path_pos +=step_distance
		if path_pos > current_signal.distance or (current_signal.distance - path_pos) <= 5:
			path_end = true
			path_pos = current_signal.distance
		
		move_player_tween(path_pos)
		print("GO")

func _on_explore_button_down() -> void:
	print("EXPLORE")
	
func move_player_tween(new_position: int) -> void:
	var tween = create_tween()
	tween_move = true
	
	var procent_dist = new_position * 100 / current_signal.distance
	var move_dist = procent_dist * 400.0 / 100.0
	
	tween.tween_property(player_sprite, 'position', Vector2(player_pos.x + move_dist, player_pos.y), 0.2)
	tween.finished.connect(func(): tween_move = false)
	tween.finished.connect(func(): tween.kill())
	
