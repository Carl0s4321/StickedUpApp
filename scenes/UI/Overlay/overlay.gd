extends Control

@onready var label = $HBoxContainer/VBoxContainer/Label
@onready var label2 = $HBoxContainer/VBoxContainer/Label2
@onready var image = $VBoxContainer/TextureRect
@onready var anim_player = $AnimationPlayer
@onready var timer = get_node("/root/Game/CanvasLayer/Control/Timer")


func _ready() -> void:
	$VBoxContainer2.visible = false
	$HBoxContainer.visible = false
	

func show_message(type):

	match type:
		MyTimer.TimerEvent.HALFTIME:
			$VBoxContainer2.visible = true
			$VBoxContainer2/Label.text = "%2d" % (timer.time)
			$VBoxContainer2/Label2.text = "Seconds\nleft"
		MyTimer.TimerEvent.OVERTIME:
			$HBoxContainer.visible=true
			$HBoxContainer/VBoxContainer/Label.text = "SUDDEN DEATH"
			$HBoxContainer/VBoxContainer/Label2.text= "DECREASING HEALTH"
			pass
		MyTimer.TimerEvent.FINISHED:
			pass
