extends "FlippablePhysics2D/FlippablePhysics2D.gd".FlippableRigidBody2D

func _ready():
	var h_timer = Timer.new()
	add_child(h_timer)
	h_timer.set_wait_time(1.0)
	h_timer.connect("timeout", self, "flipme_h")
	h_timer.start()
	
	var v_timer = Timer.new()
	add_child(v_timer)
	v_timer.set_wait_time(0.5)
	v_timer.connect("timeout", self, "flipme_v")
	v_timer.start()
	
func flipme_h():
	set_flip_h(not get_flip_h())
	
func flipme_v():
	set_flip_v(not get_flip_v())