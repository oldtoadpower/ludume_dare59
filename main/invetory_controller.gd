class_name InventoryController
extends Node2D

const ITEM = preload("uid://dnk0celfopi4p")
const MAX_ITEMS = 20

@export var tools_list: Array[GameTools] = []
@export var storage: Array[GameTools] = []

var current_inventory: Array[GameTools] = []
var current_mass: int = 0
var current_items: int = 0

#enum item_type_dict = (food, water, med)

@onready var inventory_node: Node2D = $inventory_node

func _ready() -> void:
	Main.inventory_controller = self
	
	add_item_to_inventory("food")
	add_item_to_inventory("food")
	add_item_to_inventory("food")
	add_item_to_inventory("food")
	add_item_to_inventory("food")
	
	for item in current_inventory:
		create_item(item.name, item.type)
		current_items += 1
		


func add_item_to_inventory(item_name: String) -> void:
	for res in storage:
		if item_name == res.name:
			current_inventory.append(res)
			current_mass += res.weight_item
			res.number -= 1
			
func create_item(item_name: String, item_type:String, item_sprite = 0) -> void:
	var item = ITEM.instantiate()
	item.global_position = Vector2(-260.0 + current_items * 30, 0.0)
	item.item_name = item_name
	item.item_type = item_type
	
	if not item_sprite:
		pass
	
	inventory_node.add_child(item)
	print("create ", item_name)
			
