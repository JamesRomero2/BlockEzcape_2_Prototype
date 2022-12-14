extends KinematicBody2D

signal PlayerEnteredInteractableArea

var pickedUp : bool = false setget _setPickedUp, _getPickedUp
var blocksVelocity : Vector2 = Vector2.ZERO setget _setBlocksVelocity, _getBlocksVelocity
var velocity : Vector2 = Vector2.ZERO

func _process(delta):
	if _getPickedUp():
		move_and_collide(_getBlocksVelocity())
	else:
		move_and_collide(Vector2.ZERO)

func _setPickedUp(value):
	pickedUp = value
	
func _getPickedUp():
	return pickedUp

func _setBlocksVelocity(value):
	blocksVelocity = value
	
func _getBlocksVelocity():
	return blocksVelocity

func _on_InteractableArea_body_entered(body):
	if body.name == "Player":
#		print("First Checks Approve")
		body._setPlayerIsInHandle(true)
