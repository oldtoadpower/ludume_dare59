class_name Global_param
extends Node

var med: int = 10
var energy: int = 10

var event_percent: int = 20

var empty_energy: bool = false

func _process(_delta: float) -> void:
	if energy <= 0 and not empty_energy:
		empty_energy = true
		print("EMPTY ENERGY!")

func add_med(points: int) -> void:
	med += points
	print("now MED= ", med)
	
func add_energy(points: int) -> void:
	med += points
	print("now energy= ", energy)
	
func reset_param() -> void:
	med = 10
	energy = 10
	
	empty_energy = false
