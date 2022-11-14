/// @description Game Start
show_message("Welcome to Snake");
RoomWidth = get_integer("Enter field size", 10);
RoomHeight = RoomWidth;
room_width = RoomWidth * 32;
room_height = room_width;
camera_set_view_size(view_camera[0], room_width, room_height);