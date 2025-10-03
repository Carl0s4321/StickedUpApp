extends Control

class_name MyTimer

enum TimerEvent { HALFTIME, OVERTIME, FINISHED }
signal timer_event(event_type)

var TIME:float = 60.0
# total time in seconds
var time: float = TIME
var minutes: int = 0
var seconds: int = 0
var used_overtime: bool = false

@onready var minLabel = $PanelContainer/VBoxContainer/HBoxContainer/Minute
@onready var secLabel = $PanelContainer/VBoxContainer/HBoxContainer/Second
@onready var title = $PanelContainer/VBoxContainer/Label

func setOvertime():
	emit_signal("timer_event", TimerEvent.OVERTIME)
	used_overtime = true
	time = TIME
	title.text = "Overtime"
	$PanelContainer.self_modulate = Color(100,0,0)

func _process(delta: float) -> void:
	if time <= 0.0:
		if not used_overtime:
			setOvertime()
		else:
			emit_signal("timer_event", TimerEvent.FINISHED)
			stop()
	if int(time) == int(TIME/2) && not used_overtime:
		emit_signal("timer_event", TimerEvent.HALFTIME)
	time -= delta
	minutes = int(time) / 60
	seconds = int(time) % 60
	
	minLabel.text = "%02d:" % minutes
	secLabel.text = "%02d" % seconds

func stop():
	set_process(false)
