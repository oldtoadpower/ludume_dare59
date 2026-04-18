extends Node2D

var item_name: String
var item_type: String
var def_scale: Vector2

@onready var item_sprite: Sprite2D = $item_sprite


func _ready() -> void:
	def_scale = item_sprite.scale

func _on_button_area_mouse_entered() -> void:
	var tween = create_tween()
	
	tween.tween_property(item_sprite, 'scale', def_scale * 1.3, 0.15)
	tween.finished.connect(func(): tween.kill())

func _on_button_area_mouse_exited() -> void:
	var tween = create_tween()
	
	tween.tween_property(item_sprite, 'scale', def_scale, 0.3)
	tween.finished.connect(func(): tween.kill())

func _on_button_area_input_event(_viewport: Viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		print("press on ", item_name)
		
		modify_parameter(Main.game_controller.player)
		self.queue_free()
		

func modify_parameter(player_run: Player) -> void:
	match item_type:
		"food":
			player_run.hp += 5
		"water":
			player_run.water += 10
		"med":
			player_run.hp += 20
