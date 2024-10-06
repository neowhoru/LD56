/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
//draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 0.7 + 0.3 * dsin(time * 360));

var glowColor = make_color_hsv(200 + 55 * dsin(time * 360), 255, 255); // Ändert die Farbe basierend auf Zeit
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, glowColor, 1);