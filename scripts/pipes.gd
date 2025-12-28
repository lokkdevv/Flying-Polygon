extends Node2D

@export var speed = 210

func _process(delta: float) -> void:
	position.x -= speed * delta
	if GameManager.Dead:
		freezePipes()

func _on_top_pipe_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.Dead = true

func _on_bottom_pipe_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.Dead = true

func _on_middle_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.add_score()

func setPipeSpeed(Speed):
	speed = Speed

func freezePipes():
	setPipeSpeed(0)
