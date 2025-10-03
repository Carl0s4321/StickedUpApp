extends AnimatedSprite2D

func _ready():
	connect("animation_finished", Callable(self, "_on_animation_finished"))

func _on_animation_finished():
	queue_free()  # auto-remove after animation
