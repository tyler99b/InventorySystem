extends Node

@onready var item_in_hand_node:Node = $ItemInHand

var inventories : Array = []
var item_in_hand = null

func _ready():
	SignalManager.connect("inventory_ready",_on_inventory_ready)
	pass # Replace with function body.

func _on_inventory_ready(inventory):
	inventories.append(inventory)
	
	for slot in inventory.slots:
		slot.connect("mouse_entered",_on_mouse_entered_slot, [slot])
		slot.connect("mouse_exited",_on_mouse_exited_slot)
		slot.connect("gui_input",_on_gui_input_slot, [slot])
	
func _on_mouse_entered_slot(slot):
	pass
	
func _on_mouse_exited_slot():
	pass
	
func _on_gui_input_slot():
	pass
