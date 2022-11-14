/// @description 
#macro TILE_SIZE 32
#macro GRID_DEPTH 3

global.OneSecond = 16;
alarm[0] = global.OneSecond;
JointLength = 3;
MoveDirection = Move.Right;
LastDirection = Move.Right;

enum Move {
	Right,
	Up,
	Left,
	Down
}
enum Transform{
	X, Y, Scale, Rot
}
SnakeBody = ds_grid_create(GRID_DEPTH, JointLength);
for(var i = 0; i < JointLength; i++){
SnakeBody[# Transform.X, i] = x;
SnakeBody[# Transform.Y, i] = y;
SnakeBody[# Transform.Scale, i] = 1;
}

SnakeHead = [SnakeBody[# Transform.X, 0], SnakeBody[# Transform.Y, 0], SnakeBody[# Transform.Scale, 1]];