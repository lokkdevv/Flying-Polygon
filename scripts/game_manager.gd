extends Node

@onready var scoreUI: Label

var Dead = false
var Score = 0

func setScoreUI(ScoreUI):
	scoreUI = ScoreUI

func add_score():
	Score += 1
	scoreUI.text = str(Score)

func restartGame():
	Score = 0
	Dead = false
	get_tree().reload_current_scene()
