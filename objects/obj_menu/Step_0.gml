/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben

var stick_delay_max = 10;  // Maximale Verzögerung (Anzahl der Schritte)
if (!variable_instance_exists(id, "stick_delay_timer")) {
    stick_delay_timer = 0;  // Initialisierung des Timers
}

// ToDo: https://www.reddit.com/r/gamemaker/comments/3jb0ao/better_method_for_analogcontrolled_menu/
var menu_input = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)
var _menu_submit_pressed = keyboard_check_pressed(vk_space)


for (var i = 0; i < gamepad_get_device_count(); i++) {
    // Überprüfen des D-Pads
    if (gamepad_button_check_pressed(i, gp_padd)) {
		show_debug_message("gamepad menu down Dpad{0}",i)
        menu_input += 1;
    } else if (gamepad_button_check_pressed(i, gp_padu)) {
		show_debug_message("gamepad menu up Dpad{0}",i)
        menu_input -= 1;
    }

    // Überprüfen der Analog-Sticks
	 if (stick_delay_timer <= 0) {
    var axis_y = gamepad_axis_value(i, gp_axislv);
	    if (axis_y > 0.8) {
			show_debug_message("gamepad menu down axis {0}",axis_y)
	        menu_input += 1;
			stick_delay_timer = stick_delay_max;
	    } else if (axis_y < -0.8) {
			show_debug_message("gamepad menu up axis {0}",axis_y)
	        menu_input -= 1;
			stick_delay_timer = stick_delay_max;
	    }
	 }

    // Überprüfen der Bestätigungs-Taste
    if (gamepad_button_check_pressed(i, gp_face1)) {
		show_debug_message("gamepad submit {0}",i)
        _menu_submit_pressed = true;
    }
}

menu_selected_index += menu_input

var _menu_array_length = array_length(menu_items)

if (menu_selected_index  >= _menu_array_length) menu_selected_index = 0;
if (menu_selected_index <0) menu_selected_index = _menu_array_length -1;

if (_menu_submit_pressed) {
	
	switch(menu_selected_index) {
		case 0:
			FadeToRoom(room_next(room), 60, c_black);
		break;
		
		case 1:
		  // ToDo: continue game from saved game room index
			game_end();
		break;
		
		case 2:
			game_end();
		break;
	}
}

if (stick_delay_timer > 0) {
    stick_delay_timer--;
}