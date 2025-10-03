extends Node2D

@onready var player_health_bar = $CanvasLayer/Control/PlayerHealthbar
@onready var enemy_health_bar  = $CanvasLayer/Control/enemyHealthbar
@onready var ability = $CanvasLayer/Control/Ability

@onready var overlay = $CanvasLayer/Control/Overlay
@onready var tap_effect_scene = preload("res://scenes/TapEffect.tscn")
@onready var enemy = $enemy

@onready var timer = $CanvasLayer/Control/Timer

var ATTACK_AMOUNT = 1
var INC_ENERGY = 1



func _ready():
	timer.connect("timer_event", Callable(self, "_on_timer_event"))

func _on_timer_event(event_type):
	match event_type:
		timer.TimerEvent.HALFTIME:
			overlay.show_message(timer.TimerEvent.HALFTIME)
		timer.TimerEvent.OVERTIME:
			overlay.show_message(timer.TimerEvent.OVERTIME)
		timer.TimerEvent.FINISHED:
			overlay.show_message(timer.TimerEvent.FINISHED)

func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		enemy_health_bar.lower_health(ATTACK_AMOUNT)
		var effect = tap_effect_scene.instantiate()
		effect.position = Vector2(200, 240)
		add_child(effect)
		effect.play("tap_blue")
		enemy.play_hurt()
		ability.inc_energy(INC_ENERGY)
