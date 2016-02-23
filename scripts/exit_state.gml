///exit_state() - exit, stage right

if (image_alpha > 0) {
  image_alpha -= .25;
}
else {
  if (room != room_last) {
    room_goto_next();
  }
  else {
    game_restart();
  }
}
