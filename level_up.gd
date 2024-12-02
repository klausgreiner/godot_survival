extends CanvasLayer


@onready var player = get_node("/root/Game/Player")
	

func _on_levelup_pressed() -> void:
	%LevelUp.visible = false
	get_tree().paused = false


func _on_max_health_pressed() -> void:
	player.increaseHealth()
	_on_levelup_pressed()


func _on_heal_pressed() -> void:
	player.increaseHealth()
	_on_levelup_pressed()


func _on_attack_pressed() -> void:
	player.increaseAttack()
	_on_levelup_pressed()
	
