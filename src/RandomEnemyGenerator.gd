extends Node2D

export (int) var numberOfEnemy
export (float) var enemySpawnTimer
export (Vector2) var randomEnemyPosition

var enemyPath = preload("res://src/Actors/Enemy.tscn")

func _ready():
	var rand = RandomNumberGenerator.new()
	while (true):
		yield(get_tree().create_timer(enemySpawnTimer), "timeout")
		
		for i in range(0, numberOfEnemy):
			var enemy = enemyPath.instance()
			randomize()
			var randXPos = rand.randf_range(0, randomEnemyPosition.x)
			randomize()			
			var randYPos = rand.randf_range(0, randomEnemyPosition.y)
			
			var enemyPosition = Vector2(randXPos, randYPos)
			
			enemy.position = enemyPosition
			add_child(enemy)
