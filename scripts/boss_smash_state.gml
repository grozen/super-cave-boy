/// Boss SMASH!
if (!place_meeting(x, y+1, Solid)) {
    if (vspd < 16) {
        vspd += 2;
    }
    
    move(Solid);
}
else {
    vspd = 0;
    state = boss_stall_state;
    alarm[0] = room_speed;
    audio_play_sound(snd_step, 8, false);
    
    if (place_meeting(x, y, Lava)) {
        hp -= 1;
        audio_play_sound(snd_snake, 9, false);
    }
}
