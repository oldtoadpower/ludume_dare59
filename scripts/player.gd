class_name Player
extends Node

var hp: int = 100
var water: int = 100
var ammo: int = 50
var karma: int = 0

var player_dead: bool = false

func _process(_delta: float) -> void:
	if hp <= 0 and not player_dead:
		player_dead = true
		print("PLAER DEAD")

func add_hp(points: int) -> void:
	hp += points
	print("now HP= ", hp)
	
func add_water(points: int) -> void:
	water += points
	print("now water= ", water)
	
func add_ammo(points: int) -> void:
	ammo += points
	print("now ammo= ", ammo)
	
func add_karma(points: int) -> void:
	karma += points
	print("now karma= ", karma)
	
func reset_param() -> void:
	hp = 100
	water = 100
	ammo = 50
	karma = 0
	
	player_dead = false
