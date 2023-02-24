extends NinePatchRect

@onready var inventory_container:Node = $InventoryContainer

var current_inventories: Array = []

func _ready():
	SignalManager.connect("inventory_opened", _on_inventory_opened)
	pass
	
	
func close():
	for i in current_inventories:
		inventory_container.remove_child(i)
	
	current_inventories = []
	hide()
	
func _on_inventory_opened(inventory: Inventory):
	if current_inventories.size() == 0:
		size.y = 20
		
	if current_inventories.has(inventory):
		return
		
	inventory_container.add_child(inventory)
	current_inventories.append(inventory)
	size.y += inventory.size.y + inventory_container.get_theme_constant("separation")
	show()


func _on_close_pressed():
	close()
