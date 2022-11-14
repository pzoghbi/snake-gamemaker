/// @description Movement Check
if keyboard_check(vk_up) and LastDirection != Move.Down{
	MoveDirection = Move.Up;
}
if keyboard_check(vk_left) and LastDirection != Move.Right{
	MoveDirection = Move.Left;
}
if keyboard_check(vk_down) and LastDirection != Move.Up{
	MoveDirection = Move.Down;
}
if keyboard_check(vk_right) and LastDirection != Move.Left{
	MoveDirection = Move.Right;
}