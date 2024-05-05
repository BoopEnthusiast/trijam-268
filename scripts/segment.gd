class_name Segment extends AnimatableBody2D

var next_segment

var global_positions: Array[Vector2]

var direction: Vector2


func _enter_tree():
	Singleton.player_node.segments.append(self)


func _ready():
	next_segment = Singleton.player_node.segments[Singleton.player_node.segments.find(self) - 1]


func _physics_process(delta):
	global_positions.push_back(global_position)
	while global_positions.size() > 12:
		global_positions.pop_front()
	
	if not next_segment.global_positions.is_empty():
		direction = global_position.direction_to(next_segment.global_positions[0])
		rotation = direction.angle()
		move_and_collide(direction * Singleton.player_node.SPEED * delta)


