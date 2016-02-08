/// bat_idle_state() - Things bats do when idle
image_index = spr_bat_idle;

// Look for the player
if (instance_exists(Player)) {
  if (distance_to_object(Player) < sight) {
    state = bat_chase_state;
  }
}
