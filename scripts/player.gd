class_name Player
extends Node

var hp: int = 100
var water: int = 100
var ammo: int = 50
var karma: int = 0
var money: int = 0

var med: int = 10
var energy: int = 10

var event_percent: float = 50.0
var step_bonus: float = 0.0

var empty_energy: bool = false
var player_dead: bool = false


func reset_param() -> void:
	hp = 100
	water = 100
	ammo = 50
	karma = 0
	
	med = 10
	energy = 10
	
	player_dead = false
