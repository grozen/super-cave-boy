///move_state() - controls the player

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
    vspd = -jumpspd;
    audio_play_sound(snd_jump, 5, false);
  }

  if (hspd == 0) {
    sprite_index = spr_player_idle;
  }
  else {
    sprite_index = spr_player_walk;
    image_speed = .6;
  }
}

if (right || left) {
  var dir = (right - left);
  hspd += dir * acc;
  if (dir != 0) {
    image_xscale = dir;
  }
  
  if (abs(hspd) > spd) {
    hspd = spd * dir;
  }
}
else {
  apply_friction(acc);
}

if (place_meeting(x, y + vspd + 1, Solid) && vspd > 0) {
  // Play landing sound
  audio_emitter_pitch(audio_em, random_range(.8, 1.2));
  audio_emitter_gain(audio_em, .2);
  audio_play_sound_on(audio_em, snd_step, false, 6);
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
  
  audio_emitter_pitch(audio_em, 1.5);
  audio_emitter_gain(audio_em, .1);
  audio_play_sound_on(audio_em, snd_step, false, 6);
}
