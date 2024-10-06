/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
if(!is_dead && !other.is_soaking){
	is_dead = true;
    can_move = false;
    can_soak = false;
    obj_gamemanager.alarm[0] = 120;		
}