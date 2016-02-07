/// sname_move_left_state() - move the snake to the right

// set snake visual direction
image_xscale = -1;

// move to the left
x -= 1;

// check whether we need to start moving left
var wall_at_left = place_meeting(x - 1, y, Solid);
var ledge_at_left = !position_meeting(bbox_left - 1, bbox_bottom + 1, Solid);

if (wall_at_left || ledge_at_left) {
  state = snake_move_right_state;
}
