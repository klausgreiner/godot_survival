extends Node2D


func play_walk():
	%AnimationPlayer.play("walk")
	%JumpSound.play()


func play_hurt():
	%AnimationPlayer.play("hurt")
	%AnimationPlayer.queue("walk")
