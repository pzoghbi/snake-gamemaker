/// @description Move the Snake
alarm[0] = global.OneSecond;
// Create Level Grid
SnakeGrid = ds_grid_create(GMOBJECT_Game.RoomWidth, GMOBJECT_Game.RoomHeight);
ds_grid_clear(SnakeGrid, 0);
// Joints follow-up the head
for(var JointIndex = JointLength-1; JointIndex>0; JointIndex--){
SnakeBody[# Transform.X, JointIndex] = SnakeBody[# Transform.X, JointIndex-1];
SnakeBody[# Transform.Y, JointIndex] = SnakeBody[# Transform.Y, JointIndex-1];
SnakeBody[# Transform.Scale, JointLength-1] = 1;
// set current grid position to 1
var a = SnakeBody[# Transform.X, JointIndex] / TILE_SIZE;
var b = SnakeBody[# Transform.Y, JointIndex] / TILE_SIZE;
SnakeGrid[# a, b] = 1;
}
// Head updates movement
SnakeBody[# Transform.X, 0] += lengthdir_x(TILE_SIZE, MoveDirection * 90);	// store the next step x in the head slot
SnakeBody[# Transform.Y, 0] += lengthdir_y(TILE_SIZE, MoveDirection * 90);	// store the next step y in the head slot
LastDirection = MoveDirection;
x = SnakeBody[# Transform.X, 0];	// store the x position relative to the head in x
y = SnakeBody[# Transform.Y, 0];	// store the y position relative to the head in y
if (x >= room_width) {	x = 0; }	// going off screen teleports to the opposite side
if (y >= room_height) {	y = 0; }
if (x < 0) { x = room_width - TILE_SIZE; }
if (y < 0) { y = room_height - TILE_SIZE; }
SnakeBody[# Transform.X, 0] = x;	// set position relative to the head
SnakeBody[# Transform.Y, 0] = y;	
SnakeHead = [SnakeBody[# Transform.X, 0], SnakeBody[# Transform.Y, 0]];

// Collision Event
for(var JointIndex = JointLength-1; JointIndex>0; JointIndex--){
var HeadCollisionX = SnakeBody[# Transform.X, JointIndex];
var HeadCollisionY = SnakeBody[# Transform.Y, JointIndex];
var HeadX = SnakeHead[Transform.X];
var HeadY = SnakeHead[Transform.Y];
	if (HeadCollisionX == HeadX) and (HeadCollisionY == HeadY) {
		show_question_async("Game Over. Restart?");
		alarm[0] = -1;
	}
}

if !instance_exists(GMOBJECT_Food) {
	// check if place is free
	var RandomSpawnX = GMSCRIPT_GetRoomRandom();
	var RandomSpawnY = GMSCRIPT_GetRoomRandom();
	
	for(var i = 0; i < GMOBJECT_Game.RoomWidth; i++) {
		for(var j = 0; j < GMOBJECT_Game.RoomHeight; j++) {
			if (SnakeGrid[# RandomSpawnX, RandomSpawnY] == 1) {
				RandomSpawnX = GMSCRIPT_GetRoomRandom();
				RandomSpawnY = GMSCRIPT_GetRoomRandom();
				i=0;
				j=0;
			}
		}
	}
	// if it is, spawn food there
	instance_create_layer(RandomSpawnX * 32, RandomSpawnY * 32, "Instances", GMOBJECT_Food);
}

// debugging for world grid
var row="";
for (var j = 0; j < 10; ++j) {
    for (var i = 0; i < 10; ++i) {
	    if SnakeGrid[# i,j] {
			row+=" 1 ";
		} else {
			row+=" 0 ";
		}
	}
	show_debug_message(row);
	row="";
}

ds_grid_destroy(SnakeGrid);