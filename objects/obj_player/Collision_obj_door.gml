/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
if(obj_gamemanager.is_all_enemis_soaked && !obj_gamemanager.is_level_finished)
{
	    other.is_door_opened = true;
		obj_gamemanager.is_level_finished = true;
		obj_gamemanager.alarm[1] = 120;		
		can_move = false;
		can_soak = false;
		visible = false;
}