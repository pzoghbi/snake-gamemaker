ds_grid_resize(SnakeBody, ds_grid_width(SnakeBody), ds_grid_height(SnakeBody)+1);	// add new row for our snake
ds_grid_set(SnakeBody, Transform.X, ds_grid_height(SnakeBody), SnakeBody[# Transform.X, JointLength]);	// write x to it
ds_grid_set(SnakeBody, Transform.Y, ds_grid_height(SnakeBody), SnakeBody[# Transform.Y, JointLength]);	// write y to it
JointLength++;