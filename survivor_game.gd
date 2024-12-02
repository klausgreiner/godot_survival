extends Node2D

@onready var background_music = $BackgroundMusic  # Background music AudioStreamPlayer
@onready var pine_tree_scene = preload("res://pine_tree.tscn")  # Preload the pine tree scene

var countDifficulty =1
var last_time = -30
var timer = 0
var minutes =0
var seconds = 0
func _ready():
	background_music.play()  
	spawn_trees()


func spawn_mob():
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position	
	new_mob.damage = new_mob.damage * (countDifficulty * 0.5)
	add_child(new_mob)


func _on_timer_timeout() -> void:	
	for i in range(countDifficulty):
		spawn_mob()


func _on_player_health_depleted() -> void:
	%GameOver.visible = true
	get_tree().paused = true
	

func _on_time_survived_timeout() -> void:
	timer += 1
	
	minutes = timer / 60
	seconds= timer % 60
	# Check if 30 seconds have passed since the last increment
	if timer - last_time >= 30:
		last_time = timer  # Update the last_time to the current time
		countDifficulty += 1  # Increment difficulty
	%LabelTimeSurvived.text = "%02d:%02d" % [minutes, seconds]


func _on_restart_pressed() -> void:
	pass # Replace with function body.
	
	
# Function to spawn pine trees all over the canvas
func spawn_trees() -> void:
	var canvas_size = get_viewport().size  # Get the size of the current canvas (screen)
	
	# Define the area where the trees can be spawned, based on canvas size
	var max_x = 5000
	var max_y = 3000

	# Spawn trees randomly all over the canvas
	var tree_count = 50  # Adjust how many trees you want to spawn
	for i in range(tree_count):
		var tree_instance = pine_tree_scene.instantiate()  # Create an instance of the pine tree scene
		# Randomize tree position within the canvas size
		tree_instance.position = Vector2(randf_range(0, max_x), randf_range(0, max_y))  
		add_child(tree_instance)  # Add the tree instance to the scene tree
