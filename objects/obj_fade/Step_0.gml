/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben

if(state == 0) {
	timer++;
	
	// Change room
	if(timer >= duration) {
		room_goto(target_room);
		
		state = 1;
	}
} else if (state == 1) {
	timer--;
	
	if (timer <= 0) {
		instance_destroy();
	}
}

// set Alpha
alpha = timer / duration;	