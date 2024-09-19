extends Area2D

var speed = 1000
var direction = Vector2.UP

func _process(delta: float) -> void:
	position += direction * speed * delta
