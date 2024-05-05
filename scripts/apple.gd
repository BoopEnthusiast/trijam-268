class_name Apple extends Area2D


func _on_body_entered(body):
	if body is Player:
		body.new_segment()
		Singleton.add_score()
		queue_free()
