extends Area2D

var armour = 6 setget set_armour
const scn_laser = preload("res://scenes/laser_ship.tscn")
signal armour_changed

func _ready():
	set_process(true)
	add_to_group("ship")
	yield(utils.create_timer(0.5),"timeout")
	shoot()
	pass

func _process(delta):
	
	var motion = (utils.mouse_pos.x - get_position().x)*0.2
	translate(Vector2(motion,0)) 
	
	var pos = get_position()
	pos.x = clamp(pos.x, 0+16, utils.view_size.x-16)
	set_position(pos)
	pass
	
func shoot():
	while true:
		var pos_left = get_node("cannons/left").get_global_position()
		var pos_right = get_node("cannons/right").get_global_position()
		create_laser(pos_left)
		create_laser(pos_right)
		yield(utils.create_timer(0.25),"timeout")
	pass
	

func set_armour(new):
	armour = new
	emit_signal("armour_changed", armour)
	if armour<=0:
		queue_free()
	pass

func create_laser(pos):
	var laser = scn_laser.instance()
	laser.set_position(pos)
	utils.main_node.add_child(laser)
	pass
	
