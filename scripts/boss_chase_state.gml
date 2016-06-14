/// Chasing all night long
var horizontal_distance = point_distance(x, y, Player.x, y);

if ((horizontal_distance < sprite_width / 3) || place_meeting(x - 1, y, Solid) || place_meeting(x + 1, y, Solid)) {
    state = boss_smash_state;
    audio_play_sound(snd_jump, 6, false);
    hspd = 0;
}
else {
    hspd = (Player.x - x) * 0.05;
    move(Solid);
}
