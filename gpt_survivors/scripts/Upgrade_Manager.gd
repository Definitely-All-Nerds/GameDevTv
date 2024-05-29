class_name Upgrade_Manager

extends Node


@export var player : Player = null
@export var lifestate : LifeState = null
@export var weapon : Weapon = null
@export var lootgrabber : loot_grabber = null
@export var amo_bar : TextureProgressBar = null

var loot : int = 0
var score : int = 0

func _ready():
	if player == null:
		player = get_parent()
	if lifestate == null:
		lifestate = player.get_node("LifeState")
	if lootgrabber == null:
		lootgrabber = player.get_node("loot_grabber")

	#check if all nodes are present
	if player == null or lifestate == null  or lootgrabber == null:
		print("Upgrade_Manager: missing nodes")
		print("player: ", player)
		print("lifestate: ", lifestate)
		print("weapon: ", weapon)
		print("lootgrabber: ", lootgrabber)
		return

	#connect signals
	lootgrabber.loot_grabbed.connect(loot_collected)

func _process(_delta):
	update_amo_bar(weapon.amunition, weapon.clip_size)


func loot_collected(value: int):
	loot += value
	score += value
	print("loot: ", loot)

func spend_loot(value: int):
	if loot >= value:
		loot -= value
		return true
	else:
		return false
func update_amo_bar(value: int, max_value: int):
	amo_bar.value = value
	amo_bar.max_value = max_value





