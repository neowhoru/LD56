// Skriptelemente wurden für v2.3.0 geändert, weitere Informationen sind unter
// https://help.yoyogames.com/hc/en-us/articles/360005277377 verfügbar
function FadeToRoom(_room, _dur, _color){
	var _inst = instance_create_depth(0,0,0, obj_fade);
	with(_inst){
		target_room = _room;
		duration = _dur;
		color = _color;
	}
}