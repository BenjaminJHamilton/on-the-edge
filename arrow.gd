class_name Arrow
extends RigidBody2D

@export var SPEED: float = 500
@export var TIME_BEFORE_DESPAWN: float = 5.0
var spawn_position: Vector2
var spawn_rotation: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawn_position
	global_rotation = spawn_rotation
	linear_velocity = Vector2(SPEED, 0).rotated(spawn_rotation)
	$DespawnTimer.wait_time = TIME_BEFORE_DESPAWN
	$DespawnTimer.start()

func _on_despawn_timer_timeout() -> void:
	queue_free()
