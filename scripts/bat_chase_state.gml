/// bat_chase_state() - Things a bat does when checking

// Make sure we have a player to chase
if (!instance_exists(Player)) {
  exit;
}

// Set direction and speeds
var dir = point_direction(x, y, Player.x, Player.y);
hspd = lengthdir_x(spd, dir);
vspd = lengthdir_y(spd, dir);

sprite_index = spr_bat_fly;

if (hspd != 0) {
  image_xscale = sign(hspd);
}

// Move
move(Solid);
