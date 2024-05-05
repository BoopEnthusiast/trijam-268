extends Area2D

var speed = 3.0
var rate_of_change = 1.1


func _physics_process(delta):
	speed *= rate_of_change
	 
	if rate_of_change > 1:
		rate_of_change *= 0.998
	else:
		rate_of_change = 1
	
	global_position += Vector2.DOWN * speed * delta
	
	if global_position.y > 124:
		Singleton.remove_score()
		queue_free()


func _on_body_entered(body):
	if body is Player or body is Segment:
		queue_free()
