class_name InventoryController
extends Node2D

const ITEM = preload("uid://dnk0celfopi4p")

@export var tools_list: Array[GameTools] = []
@export var storage: Array[GameTools] = []

var current_inventory: Array[GameTools] = []
var current_mass: int = 0

@onready var inventory_node: Node2D = $inventory_node

func _ready() -> void:
	Main.inventory_controller = self
	
	add_item_to_inventory("food")
	
	for item in current_inventory:
		create_item(item.name)
		


func add_item_to_inventory(item_name: String) -> void:
	for res in storage:
		if item_name == res.name:
			current_inventory.append(res)
			current_mass += res.weight_item
			res.number -= 1
			
func create_item(item_name: String, item_sprite = 0) -> void:
	var item = ITEM.instantiate()
	item.position = Vector2(-20.0, 0.0)
	item.item_name = item_name
	
	if not item_sprite:
		pass
	
	inventory_node.add_child(item)
	print("create ", item_name)
			
