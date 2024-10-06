/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben

var stick_delay_max = 10;  // Maximale Verzögerung (Anzahl der Schritte)
if (!variable_instance_exists(id, "stick_delay_timer")) {
    stick_delay_timer = 0;  // Initialisierung des Timers
}

var _submit_pressed = keyboard_check_pressed(vk_space)


for (var i = 0; i < gamepad_get_device_count(); i++) {

    // Überprüfen der Bestätigungs-Taste
    if (gamepad_button_check_pressed(i, gp_face1)) {
		show_debug_message("gamepad submit {0}",i)
        _submit_pressed = true;
    }
}


if (_submit_pressed) {
	room_goto(0);
}