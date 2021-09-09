extends KinematicBody2D

const DeathEffect = preload("res://Effects/BatDeathEffect.tscn")
var knockback = Vector2.ZERO

onready var stats = $Stats

func _process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200*delta)
	knockback = move_and_slide(knockback)
	
func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 140

func _on_Stats_dead():
	queue_free()
	var deathEffect = DeathEffect.instance()
	get_parent().add_child(deathEffect)
	deathEffect.global_position = global_position
