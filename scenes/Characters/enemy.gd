extends Node2D

@onready var sprite = $StaticBody2D/AnimatedSprite2D
@onready var anim_player = $AnimationPlayer
func play_hurt():
	anim_player.play("hurt")
	
func _ready():
	sprite.modulate = Color(0,0,0)
	
#func play_hurt_flash():
	## Tint red
	#sprite.modulate = Color(1, 0, 0)  
	## Reset after short delay
	#await get_tree().create_timer(0.2).timeout
	#sprite.modulate = Color(1, 1, 1)
	#
#func play_hurt_shake():
	#var original_pos = sprite.position
	#for i in range(5):
		#sprite.position = original_pos + Vector2(randf_range(-2,2), randf_range(-2,2))
		#await get_tree().process_frame
	#sprite.position = original_pos
