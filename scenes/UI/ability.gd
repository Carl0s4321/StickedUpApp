extends Control

@onready var energy = $PanelContainer/MarginContainer/VBoxContainer/Energy

var MAX_ENERGY = 20

func _ready():
	energy.min_value = 0
	energy.max_value = MAX_ENERGY
	energy.value = 0

func lower_energy(amount: int):
	energy.value = max(0, energy.value - amount)
	
func inc_energy(amount: int):
	if energy.value < MAX_ENERGY:
		energy.value = min(MAX_ENERGY, energy.value + amount)
