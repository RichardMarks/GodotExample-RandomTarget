extends Node2D

# signal emitted when the weapon needs a target
signal target_requested

# signal emitted when the weapon is given a new target by acquire_target function
signal target_acquired

var my_target

# can be called to have a new target request signal emitted
func request_target():
	emit_signal("target_requested", self)

# can be called to have a new target acquired signal emitted
func acquire_target(target):
	# weapon can now do something with the target information
	# such as rotate a turret to face the target, etc...
	my_target = target
	emit_signal("target_acquired", self, target)
