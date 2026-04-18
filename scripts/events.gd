class_name GameEvent
extends Resource

@export var text: String = ''
@export var parament: String = ''
@export var change_value: int = 0

func apply_event(target: Node) -> void:
	if target.has_method("modify_parameter"):
		target.modify_parameter(parament, change_value)
