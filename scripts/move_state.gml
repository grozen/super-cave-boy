///move_state() - controls the player
var right = keyboard_check(vk_right);
var left = keyboard_check(vk_left);
var up = keyboard_check(vk_up);
var up_release = keyboard_check_released(vk_up);
var down = keyboard_check(vk_down);

// Set speeds
if (!place_meeting(x, y+1, Solid)) {
  vspd += grav;

  // Player is in the air
  sprite_index = spr_player_jump;
  image_speed = 0;
  image_index = vspd > 0;

  if (up_release && vspd < -6) {
    vspd = -6;
  }
}
else { // We're on the ground
  vspd = 0;

  // Handle jumping
  if (up) {
    vspd = -16;
  }

  if (hspd == 0) {
    sprite_index = spr_player_idle;
  }
  else {
    sprite_index = spr_player_walk;
    image_speed = .6;
  }
}

if (right) {
  hspd = spd;
  image_xscale = 1;
}

if (left) {
  hspd = -spd;
  image_xscale = -1;
}

// "Friction"
if (!right && !left) {
  hspd = 0;
}

move(Solid);

// Check for a grabbable ledge
var falling = y - yprevious > 0;
var wasnt_wall = !position_meeting(x + (17 * image_xscale), yprevious, Solid);
var is_wall = position_meeting(x + (17 * image_xscale), y, Solid);

if (falling && wasnt_wall && is_wall) {
  hspd = 0;
  vspd = 0;

  // Move over to the ledge horizontally
  while(!place_meeting(x + image_xscale, y, Solid)) {
    x += image_xscale;
  }

  // Move to the ledge's edge vertically
  while(position_meeting(x + (17 * image_xscale), y - 1, Solid)) {
    y -= 1;
  }

  sprite_index = spr_player_ledge_grab;
  state = ledge_grab_state;
}
