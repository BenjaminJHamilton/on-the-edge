extends CharacterBody2D

@onready var arrow: PackedScene = preload("res://arrow.tscn")
const SPEED: float = 300.0


static func get_input() -> Vector2:
	var input_direction: Vector2 = Input.get_vector(
		"left",
		"right",
		"up",
		"down"
	)
	return input_direction
	
func _process(delta: float) -> void:
	
	var current_move: Vector2 = get_input()
	if current_move.length() > 0:
		rotation = current_move.angle()
		
	if Input.is_action_just_pressed("shoot"):
		fire_arrow()
	

func _physics_process(delta: float) -> void:
	velocity = get_input() * SPEED
	move_and_slide()


func fire_arrow() -> void:
	var instance: Arrow = arrow.instantiate()
	instance.spawn_position = global_position
	instance.spawn_rotation = global_rotation
	add_sibling(instance)
