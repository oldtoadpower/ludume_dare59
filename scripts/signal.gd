class_name BaseSignal
extends Node2D

var distance: int = 0
var type


func generate_distance() -> void:
	distance = 50 + randi_range(10, 100)
