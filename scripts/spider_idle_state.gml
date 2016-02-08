/// spider_idle_state() - Things spiders are doing when they aren't doing anything

if (!instance_exists(Player)) {
  exit;
}

if (distance_to_object(Player) < sight) {
  image_speed = .5;
  
  // face the player
  var dir = Player.x - x;
  if (dir != 0) {
    image_xscale = sign(dir);
  }
}
