///direction_move_bounce(collision_object)

var collision_object = argument0;
var original_hspd = hspd;
var original_vspd = vspd;

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
      var bounce_vspd = -(original_vspd / 2);
    
      if (abs(bounce_vspd) > 1 && !place_meeting(x, y + bounce_vspd, collision_object)) {
        vspd = bounce_vspd
      }
      break;
    }
  }
}

y += vspd;
