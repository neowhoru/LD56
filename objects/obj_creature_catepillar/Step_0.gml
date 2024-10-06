/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
// Überprüfen, ob der Gegner vom Spieler getroffen wurde

// ToDo: this needs to be replaced when you hit the soak area

/*
if (place_meeting(x, y, obj_soaker)) {
    is_dead = true;
	instance_destroy(); // Gegner zerstören
}*/

// Bewegung
if (!is_dead && !is_soaking) {
    x += enemy_speed * enemydirection;
	distance_traveled += abs(enemy_speed);

    // Überprüfen, ob der Gegner die maximale Distanz erreicht hat
    if (distance_traveled >= max_distance) {
        enemydirection = enemydirection == 1 ? -1 : 1;
        distance_traveled = 0;  // Zurückgelegte Distanz zurücksetzen
    }

    // Überprüfen, ob der Gegner auf dem Boden ist
    if (!place_meeting(x, y + 1, tilemapsolid)) {
        // Kein Boden unter den Füßen, Richtung ändern
        enemydirection = enemydirection == 1 ? -1 : 1;
        distance_traveled = 0;  // Zurückgelegte Distanz zurücksetzen
    }

    // Überprüfen, ob der Gegner auf ein Hindernis stößt
    if (place_meeting(x + enemy_speed * enemydirection, y, tilemapsolid)) {
        // Hindernis getroffen, Richtung ändern
        enemydirection = enemydirection == 1 ? -1 : 1;
        distance_traveled = 0;  // Zurückgelegte Distanz zurücksetzen
    }
}

if (enemydirection == -1) {
        image_xscale = 1; // Nach links spiegeln
    } else {
        image_xscale = -1; // Nach rechts (Standardrichtung)
    }

