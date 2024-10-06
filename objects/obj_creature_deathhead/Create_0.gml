event_inherited();
/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
enemy_speed = 1;

// Richtung des Gegners (-1 für links, 1 für rechts)
enemydirection = -1;

// Zustand des Gegners
is_dead = false;

// Schwerkraft und vertikale Geschwindigkeit
move_y = 0;

// Zurückgelegte Distanz und maximale Distanz
distance_traveled = 0;
max_distance = 50; // Maximaler Abstand, nach dem die Richtung geändert wird

tilemapsolid = layer_tilemap_get_id("Ground")