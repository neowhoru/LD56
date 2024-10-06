move_speed = 3;
jump_speed = 8;
grav = 0.5;

move_x = 0;
move_y = 0;

can_soak = true;
is_soaking = false;
shoot_delay = 10;
shoot_timer = 0;
suckRange = 100;

offset_soaker_x = 10;
offset_soaker_y = 15;

shoot_offset_y= 2;
shoot_offset_x= 1;

is_jumping = false;
is_dead = false;
can_move = true;

effectX = x + lengthdir_x(offset_soaker_x, direction); // X-Position verschieben
effectY = y + lengthdir_y(offset_soaker_y, direction); // Y-Position verschieben

effectInstance = instance_create_layer(effectX, effectY, "Instances", obj_soak_fx);
effectInstance.visible = false;

// Kollisionslayer
tilemapsolid = layer_tilemap_get_id("Ground"); // Kollision mit "Ground"
tilemapdeath = layer_tilemap_get_id("Death")

