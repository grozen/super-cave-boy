///move(collision_object)

var collision_object = argument0;
var original_hspd = hspd;

/// horizontal_move_bounce()

// Horizontal collisions
if (place_meeting(x + hspd, y, collision_object)) {
  for (; hspd != 0; hspd -= sign(hspd)) {
    if !place_meeting(x + hspd, y, collision_object) {
      break;
    }
  }
}

if (hspd == 0) {
  hspd = -(original_hspd / 2);
}

x += hspd;

// Vertical collisions
if (place_meeting(x, y + vspd, collision_object)) {
  for (; vspd != 0; vspd -= sign(vspd)) {
    if !place_meeting(x, y + vspd, collision_object) {
      break;
    }
  }
}

y += vspd;
