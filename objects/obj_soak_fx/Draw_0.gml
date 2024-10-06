/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
//draw_sprite(spr_soak_fx, image_index, x, y); // Zeichne den Sprite an der Position des Objekts

var xscale = 1; // Normale Skalierung (für rechts gerichtete Spieler)
if (direction == 180) {
    xscale = -1; // Spiegelung für links gerichtete Spieler
}

show_debug_message("draw direction {0}", direction);
// Zeichne den Sprite mit der entsprechenden Skalierung
draw_sprite_ext(spr_soak_fx, image_index, x, y, xscale, 1, 0, c_white, 1);