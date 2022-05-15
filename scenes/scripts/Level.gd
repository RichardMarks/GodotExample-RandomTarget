extends Node2D

func _ready():
	randomize()
	connect_ui_signals()
	connect_enemy_weapon_signals($Enemy/Weapon)

func connect_ui_signals():
	$UI/Control/Button.connect("pressed", self, "_on_UIControlButton_pressed")
	
func connect_enemy_weapon_signals(enemy_weapon):
	enemy_weapon.connect("target_requested", self, "_on_EnemyWeapon_target_requested")
	enemy_weapon.connect("target_acquired", self, "_on_EnemyWeapon_target_acquired")

func _on_UIControlButton_pressed():
	$Enemy/Weapon.request_target()

func _on_EnemyWeapon_target_requested(enemy_weapon):
	var target = $Player.get_random_target()
	enemy_weapon.acquire_target(target)

func _on_EnemyWeapon_target_acquired(enemy_weapon, target):
	$TargetIndicator.global_position = target.global_position
	
func _process(delta):
	if $Enemy/Weapon.has_target():
		var target = $Enemy/Weapon.get_target()
		$TargetIndicator.global_position = target.global_position
