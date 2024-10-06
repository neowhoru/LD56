/// @description Hier Beschreibung einfügen

var move_left_pressed = keyboard_check(vk_left);
var move_right_pressed = keyboard_check(vk_right);
var jump_pressed = keyboard_check(vk_space);
var soak_pressed = keyboard_check(vk_alt);
var soak_released = keyboard_check_released(vk_alt);

for (var i = 0; i < gamepad_get_device_count(); i++) {
    // Überprüfen des D-Pads
    if (gamepad_button_check(i, gp_padl)) {		
        move_left_pressed = true;
    } else if (gamepad_button_check(i, gp_padr)) {
		move_right_pressed = true;
    }

    // Überprüfen der Analog-Sticks
    var axis_y = gamepad_axis_value(i, gp_axislh);
    if (axis_y > 0.8) {
		move_right_pressed = true;
    } else if (axis_y < -0.8) {
		move_left_pressed = true;
    }

    // Überprüfen der Bestätigungs-Taste
    if (gamepad_button_check_pressed(i, gp_face1)) {
        jump_pressed = true;
    }
	
	if(gamepad_button_check_pressed(i,gp_face3)) {
		// Aktiviere den Screenshake
		soak_pressed = true;	
		gamepad_set_vibration(i, 0.2,0.2);
	 	gamepad_vibration_index = i; // Speichere den Index des Controllers
		alarm[0] = room_speed * 0.3; 
	}
}

if(soak_pressed && !is_dead && !is_jumping){
	is_soaking = true;	
	can_move = false;
}

if(soak_released){
	is_soaking = false;	
	can_move = true;
}

// Bewegungsinitialisierung
move_x = 0;
if(move_left_pressed){
	move_x = -move_speed;	
} else if(move_right_pressed){
	move_x = move_speed;	
}

// Schwerkraft anwenden
move_y += grav;
var on_ground = place_meeting(x, y + 1, tilemapsolid);

// Kollision und Sprunglogik
if (on_ground && can_move && !is_dead) {
	move_y = 0; // Setze die vertikale Bewegung auf 0, wenn der Spieler auf dem Boden ist
	is_jumping = false; // Spieler ist nicht im Sprung
	if (jump_pressed) {
		audio_play_sound(snd_jump, 10, false);
		move_y = -jump_speed; // Setze die Sprungkraft
		is_jumping = true; // Spieler ist jetzt im Sprung
	}
} 

// Tilemap-Kollisionsprüfung
// Horizontale Kollision
if (place_meeting(x + move_x, y, tilemapsolid)) {
	while (!place_meeting(x + sign(move_x), y, tilemapsolid)) {
		x += sign(move_x); // Bewege den Spieler, bis es eine Kollision gibt
	}
	move_x = 0; // Stoppe die horizontale Bewegung
}

// Vertikale Kollision
if (place_meeting(x, y + move_y, tilemapsolid)) {
	while (!place_meeting(x, y + sign(move_y), tilemapsolid)) {
		y += sign(move_y); // Bewege den Spieler, bis es eine Kollision gibt
	}
	move_y = 0; // Stoppe die vertikale Bewegung
}

// Tod-Kollisionsprüfung
if (place_meeting(x, y + 1, tilemapdeath) && !is_dead) {
	is_dead = true;
	can_move = false;
	can_soak = false;
	obj_gamemanager.alarm[0] = 120;
}

// Spielerbewegung
if (can_move) {
	x += move_x;
	y += move_y;

	if (move_x != 0) image_xscale = sign(move_x); // Ändere die Blickrichtung
}

// Animationen
if (is_dead) {
	 sprite_index = spr_player_death; // Entkommentiere diese Zeile, wenn du eine Sterbeanimation hast
} else if (is_jumping) {
	sprite_index = spr_player_jump; // Setze die Sprunganimation
} else if (move_x != 0 && can_move) {
	sprite_index = spr_player_walk; // Wenn in Bewegung, spr_player_walk verwenden
} else {
	sprite_index = spr_player_idle; // Wenn still, spr_player_idle verwenden
}

// Schießen
if (is_soaking) {
	show_debug_message("is soaking with direction {0}", image_xscale);
	// ToDo: implement soak
	if(!audio_is_playing(snd_soak)) {
		audio_play_sound(snd_soak, 10, false);	
	}
	
	
	if(image_xscale==1){
	   effectX = x + lengthdir_x(offset_soaker_x, direction); // X-Position verschieben
       effectY = y + lengthdir_y(offset_soaker_y,  direction); // Y-Position verschieben
	   effectInstance.direction = 0; // Richtung des Effekts anpassen
	}else{
		effectX = x - lengthdir_x(offset_soaker_x, direction); // X-Position verschieben
        effectY = y - lengthdir_y(offset_soaker_y,  direction); // Y-Position verschieben	
		effectInstance.direction = 180; // Richtung des Effekts anpassen
	}
	 

     effectInstance.x = effectX; // Position des Effekts aktualisieren
     effectInstance.y = effectY;
     effectInstance.visible = true; // Effekt anzeigen
		
	 effectX = x + lengthdir_x(offset_soaker_x, direction); // X-Position verschieben
     effectY = y + lengthdir_y(offset_soaker_y, direction); // Y-Position verschieben
	
	var enemyInRange = instance_nearest(x, y, obj_soakable);

	// If an enemy is in range and the suck button (spacebar) is pressed
	if (enemyInRange != noone ) {
	    // Calculate distance to the enemy
	    var distance = point_distance(x, y, enemyInRange.x, enemyInRange.y);
    
	    // If the enemy is within suck range
	    if (distance <= suckRange) {
			enemyInRange.is_soaking = true;
	        // Move the enemy towards the player (suck speed)
	        var suckSpeed = 4;
	        enemyInRange.x += lengthdir_x(suckSpeed, point_direction(enemyInRange.x, enemyInRange.y, x, y));
	        enemyInRange.y += lengthdir_y(suckSpeed, point_direction(enemyInRange.x, enemyInRange.y, x, y));
        
	        // Optional: When the enemy is close enough, destroy or absorb it
	        if (distance <= 10) { // Example: if the enemy is close enough
	            instance_destroy(enemyInRange);
	            // Add logic here to absorb (e.g., give power-up, play animation, etc.)
	        }
	    }
	}
} else {
	audio_stop_sound(snd_soak);
	effectInstance.visible = false;	
}

if (!can_soak) {
	shoot_timer -= 1;
	if (shoot_timer <= 0) {
		can_soak = true;
	}
}
