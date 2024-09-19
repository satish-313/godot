extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laserbeam.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func _on_gate_player_enter_the_gate(_body) -> void:
	pass


func _on_player_grenade_shoot(pos,direction) -> void:
	var grenade =  grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * 100
	$Projectiles.add_child(grenade)
	
func _on_player_laser_shoot(pos,direction) -> void:
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)
