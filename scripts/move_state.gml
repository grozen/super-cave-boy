///move_state() - controls the player
var right = keyboard_check(vk_right);
var left = keyboard_check(vk_left);
var up = keyboard_check(vk_up);
var up_release = keyboard_check_released(vk_up);
var down = keyboard_check(vk_down);

// Set speeds
if (!place_meeting(x, y+1, Solid)) {
  vspd += grav;

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
}

if (right) {
  hspd = spd;
}

if (left) {
  hspd = -spd;
}

// "Friction"
if (!right && !left) {
  hspd = 0;
}

move(Solid);
