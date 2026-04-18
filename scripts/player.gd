class_name Player
extends Node

var hp: int = 100
var water: int = 100
var ammo: int = 50
var karma: int = 0

var step_bonus: int = 0

var player_dead: bool = false


func reset_param() -> void:
	hp = 100
	water = 100
	ammo = 50
	karma = 0
	
	player_dead = false
