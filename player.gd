extends CharacterBody2D
signal health_depleted
var health = 100.0
var maxHealth = 100.0
var experience = 0.0
var currentLevel = 1
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


	if overlapping_mobs.size() > 0:
		health -= overlapping_mobs[0].damage * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()

func addExperience(expBase):
	experience += expBase /currentLevel
	if experience >= 100:
		levelUp()		
	%Experience.value = experience
	
func levelUp():
		currentLevel += 1
		experience = 0
		%LevelUpSoundPlayer.play() 
		%LevelUp.visible = true
		get_tree().paused = true
		
	
func increaseHealth():
	health = maxHealth + 10
	health =  health	
	%ProgressBar.value = health

func heal():
	health = maxHealth
	%ProgressBar.value = health	
func increaseAttack():
	attackDamage +=1
	
	
