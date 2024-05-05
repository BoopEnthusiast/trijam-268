extends Node

var player_node: Player
var main_node: Node2D
var score_label: Label

var score = 10


func add_score() -> void:
	score += 1
	score_label.text = "Life: " + str(score)


func remove_score() -> void:
	score -= 1
	score_label.text = "Life: " + str(score)
	if score <= 0:
		main_node.start_lose_timer()
