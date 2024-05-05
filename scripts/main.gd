extends Node2D


const RAIN_DROP = preload("res://scenes/rain_drop.tscn")
const APPLE = preload("res://scenes/apple.tscn")

@onready var spawn_time = $SpawnTime
@onready var lose_timer = $LoseTimer
@onready var lose_label = $ScoreLayer/Label
@onready var time = $ScoreLayer/Time

var time_value = 0

func _enter_tree():
	Singleton.main_node = self


func _on_spawn_time_timeout():
	spawn_time.wait_time *= 0.97
	var new_drop = RAIN_DROP.instantiate()
	new_drop.global_position.x = randf_range(0, 128)
	add_child(new_drop)


func _on_apple_spawn_timer_timeout():
	var new_apple = APPLE.instantiate()
	new_apple.global_position = Vector2(randf_range(10, 118), randf_range(10, 118))
	add_child(new_apple)


func start_lose_timer() -> void:
	lose_label.visible = true
	if lose_timer.is_stopped():
		lose_timer.start()


func _on_lose_timer_timeout():
	get_tree().quit()


func _on_timer_timeout():
	time_value += 1
	time.text = "Time: " + str(time_value)
