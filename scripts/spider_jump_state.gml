/// spider_jump_state() - Things a spider does when jumping
image_index = image_number - 1;

// Gravity
if (!place_meeting(x, y + 1, Solid)) {
  vspd += grav;
}
else {
  vspd = 0;
  
  apply_friction(acc);
  
  // Become tired
  if (hspd == 0 && vspd == 0) {
    state = spider_tired_state;
    
    alarm[0] = 15;
  }
}

if (hspd != 0) {
  image_xscale = sign(hspd);
}

// Move
horizontal_move_bounce(Solid);
