/// @description Hier Beschreibung einfügen
// Sie können Ihren Code in diesem Editor schreiben
if (global.shake) 
{ 
   shake_time -= 1; 
   var _xval = choose(-shake_magnitude, shake_magnitude); 
   var _yval = choose(-shake_magnitude, shake_magnitude); 
   show_debug_message("Shake camera on camera {0}", view_camera[0]);
   camera_set_view_pos(view_camera[0], _xval, _yval); 
   show_debug_message("screenshake time:{0} mag {1} fade {2}", shake_time, _xval, _yval);
   if (shake_time <= 0) 
   { 
      shake_magnitude -= shake_fade; 

      if (shake_magnitude <= 0) 
      { 
         camera_set_view_pos(view_camera[0], 0, 0); 
         global.shake = false; 
      } 
   } 
}
