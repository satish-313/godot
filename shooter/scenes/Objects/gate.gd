extends StaticBody2D

signal player_enter_the_gate(body)

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_enter_the_gate.emit(body)
