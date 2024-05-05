class_name Player extends CharacterBody2D

const SEGMENT = preload("res://scenes/segment.tscn")
const SPEED = 50.0
const TURN_SPEED = 160.0

var segments: Array 

var direction: Vector2 = Vector2.RIGHT

var global_positions: Array[Vector2]


func _enter_tree():
	Singleton.player_node = self
	segments.append(self)


func _physics_process(delta):
	global_positions.push_back(global_position)
	while global_positions.size() > 12:
		global_positions.pop_front()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var turn_direction = Input.get_axis("left", "right")
	if turn_direction:
		direction = direction.rotated(deg_to_rad(TURN_SPEED * delta * turn_direction))
		rotation = direction.angle()
	
	velocity = direction * SPEED
	
	move_and_slide()


func new_segment() -> void:
	var newly_made_segment = SEGMENT.instantiate()
	newly_made_segment.global_position = segments.back().global_position
	Singleton.main_node.call_deferred("add_child", newly_made_segment)
