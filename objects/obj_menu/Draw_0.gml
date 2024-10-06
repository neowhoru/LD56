/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
for(var i=0; i<array_length(menu_items); i++) {
	if (menu_selected_index != i) draw_set_alpha(0.7);
	
	draw_text(y,x + 24*i, menu_items[i]);
	draw_set_alpha(1);
}