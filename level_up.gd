extends Node2D

@onready var player = get_node("/root/Game/Player")

func _on_attack_pressed() -> void:
	player.attackDamage += 1
	_on_levelup_pressed()


func _on_cure_pressed() -> void:
	player.health += 10
	_on_levelup_pressed()
	


func _on_health_pressed() -> void:
	player.health = player.maxHealth + 10
	player.health =  player.health
	_on_levelup_pressed()

func _on_levelup_pressed() -> void:
	%LevelUp.visible = false
	get_tree().paused = false
	get_tree().reload_current_scene()	
