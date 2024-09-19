extends CharacterBody2D

signal laser_shoot(pos,direction)
signal grenade_shoot(pos,direction)
var can_laser:bool = true
var can_grenade:bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Input
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primaryaction") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi()%laser_markers.size()]
		laser_shoot.emit(selected_laser.global_position,player_direction)
		can_laser = false
		$LaserTimer.start()
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		var pos = $LaserStartPositions.get_children()[0].global_position
		grenade_shoot.emit(pos,player_direction)
		can_grenade = false
		$GrenadeTimer.start()
		
		
func _on_laser_timer_timeout() -> void:
	can_laser = true

func _on_grenade_timer_timeout() -> void:
	can_grenade = true
