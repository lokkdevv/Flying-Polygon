extends Node2D

@onready var pipe = preload("res://scenes/pipes.tscn")
@onready var timer: Timer = $"../gameManager/Timer"

var timerInterval = 2
var minTimerInterval = 1

var instantiatedPipes: Array

func _process(delta: float) -> void:
	timerInterval -= delta * 0.009
	timerInterval = clamp(timerInterval, minTimerInterval, timerInterval)
	
	if not instantiatedPipes.is_empty():
		for i in range(instantiatedPipes.size() - 1, -1, -1):
			if instantiatedPipes[i].position.x <= -450:
				instantiatedPipes[i].queue_free()
				instantiatedPipes.remove_at(i)

func changePipeYPosition(Pipe):
	Pipe.position.y = randi_range(-200, 200)

func _on_timer_timeout() -> void:
	instantiatedPipes.append(pipe.instantiate())
	changePipeYPosition(instantiatedPipes[-1])
	add_child(instantiatedPipes[-1])
	timer.wait_time = timerInterval
