/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
// Create-Event von obj_glowbug

event_inherited();
// Bewegungseigenschaften
speed = 1 + irandom_range(2, 4); // Geschwindigkeit zwischen 2 und 5
direction = random(360); // Zufällige Startbewegungsrichtung
amplitude = 16; // Die Amplitude für die Wellenbewegung
frequency = 0.02; // Frequenz für die Wellenbewegung

// Zufällige Timer-Variablen für Richtung ändern
changeDirectionTimer = 60 + irandom(60); // Timer bis zur nächsten Richtungsänderung

// Startpositionen merken
startX = x; // Start-X für die Wellenbewegung
startY = y; // Start-Y für die Wellenbewegung
time = 0; // Zeitvariable für die Wellenbewegung

reset_pos_on_soak = false;
