/// Be idle like a boss

var player_distance = point_distance(x, y, Player.x, Player.y);

if (player_distance <= 128) {
    state = boss_lift_state;
    
    if (!audio_is_playing(snd_music)) {
        audio_emitter_gain(audio_em, .5);
        audio_play_sound_on(audio_em, snd_boss_music, true, 10);
    }
}
