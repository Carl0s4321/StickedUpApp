extends Control

@onready var bar: TextureProgressBar = $TextureProgressBar

func lower_health(amount: int):
	bar.value = max(0, bar.value - amount)
