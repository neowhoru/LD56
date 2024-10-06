/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
// Step-Event von obj_glowbug

// 1. Zufällige Richtungsänderung nach einem Timer
if(!is_soaking){
	changeDirectionTimer -= 1;
	if (changeDirectionTimer <= 0) {
	    direction += irandom_range(-90, 90); // Zufällig die Richtung etwas ändern
	    changeDirectionTimer = 60 + irandom(60); // Timer zurücksetzen
	}

	// 2. Wellenbewegung um die Hauptrichtung herum berechnen
	// Zeit erhöhen (je höher die Frequenz, desto schneller die Bewegung)
	time += frequency;

	// Berechne die neue Position basierend auf der Wellenbewegung
	var waveX = startX + lengthdir_x(speed, direction) + amplitude * dcos(time * 360);
	var waveY = startY + lengthdir_y(speed, direction) + amplitude * dsin(time * 360);

	// 3. Position setzen und Richtung updaten
	x = waveX;
	y = waveY;

	// 4. Optional: Grenzen prüfen oder außerhalb des Bildschirms zurücksetzen
	if (x < 0 || x > room_width || y < 0 || y > room_height) {
	    direction += 180; // Drehe um, wenn es den Raum verlässt
	}
}else{
	if(!reset_pos_on_soak){
		reset_pos_on_soak = true;
		x = startX;
		y = startY;
		direction = 0;
		speed = 0;
	}
	show_debug_message("firefly is soaking x {0}, y{1}",x,y);
	
}