extends CharacterBody2D
signal health_depleted
var health = 100.0
var maxHealth = 100.0
var experience = 90.0
var currentLevel = 0.0
var attackDamage = 1


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()		
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	const DAMAGE_RATE = 50
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()

func addExperience(expBase):
	experience += expBase 
	if experience >= 100:
		currentLevel += 1
		experience = 0	
		%LevelUp.visible = true
		get_tree().paused = true
		
	%Experience.value = experience
	
		
	
