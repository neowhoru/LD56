// Skriptelemente wurden für v2.3.0 geändert, weitere Informationen sind unter
// https://help.yoyogames.com/hc/en-us/articles/360005277377 verfügbar
function Effects(){

}

// From: https://gamemaker.io/de/tutorials/coffee-break-tutorials-juicy-screenshake-gml
function screenshake(_time, _magnitude, _fade)
{
   with (obj_screenshake)
   {
      shake = true;
      shake_time = _time;
      shake_magnitude = _magnitude;
      shake_fade = _fade;
   }
}