/// @description Promt to play again
var status = async_load[? "status"];
if status == 1 {
	room_restart();
} else {
	game_end();
}