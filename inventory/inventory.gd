class_name Inventory extends NinePatchRect

var inventory_slot_resource = preload("res://inventory/inventory_slot.tscn")

@export var inventory_name: String
@export var inventory_size: int = 0:
	set(value):
		set_inventory_size(value)
		
@onready var title:Node = $TextureRect/Label
@onready var slot_container:Node = $SlotContainer

var slots: Array = []

func _ready():
	for s in slots:
		slot_container.add_child(s)
	title.text = "-" + inventory_name + "-"
	SignalManager.emit_signal("inventory_ready",self)
	
func set_inventory_size(value):
	inventory_size = value
	self.custom_minimum_size.y = 40 + (ceil(size/5.0)-1)*22
	
	for s in inventory_size:
		var new_slot = inventory_slot_resource.instantiate()
		slots.append(new_slot)
		
func add_item(item):
	for s in slots:
		if not s.item:
			#add item
			s.set_item(item)
			return
		
