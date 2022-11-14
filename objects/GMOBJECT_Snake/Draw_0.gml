/// @description 

draw_self();

// draw snake's body
for(var i = 1; i < JointLength; i++){
	var JointX = SnakeBody[# Transform.X, i];	
	var JointY = SnakeBody[# Transform.Y, i];
	
	draw_sprite_ext(GMSPRITE_Snake_Body, 0, JointX, JointY, SnakeBody[# Transform.Scale, i], SnakeBody[# Transform.Scale, i], 0, c_white, 1);
	var HeadX1 = SnakeHead[Transform.X];
	var HeadY1 = SnakeHead[Transform.Y];
	var HeadX2 = SnakeHead[Transform.X]+32;
	var HeadY2 = SnakeHead[Transform.Y]+32;
	var TargetFood = collision_rectangle(HeadX1, HeadY1, HeadX2, HeadY2, GMOBJECT_Food, false, true);
	if instance_exists(TargetFood) {
		GMSCRIPT_AppendSnake();
		instance_destroy(TargetFood);
	}
	
}

