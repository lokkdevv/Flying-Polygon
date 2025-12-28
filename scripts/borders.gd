extends Node

func _on_top_border_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.Dead = true

func _on_bottom_border_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.Dead = true
