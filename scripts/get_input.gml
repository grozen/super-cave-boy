/// get_input() - Gets the player's input
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check_pressed(vk_up);
up_release = keyboard_check_released(vk_up);
down = keyboard_check(vk_down);
start = keyboard_check(vk_space);

// Override with gamepad if available
var gp_id = 0;
var axis_threshold = .5;

gamepad_present = gamepad_is_connected(gp_id); 

if (gamepad_present) {
    right = gamepad_axis_value(gp_id, gp_axislh) > axis_threshold || gamepad_button_check(gp_id, gp_padr);
    left = gamepad_axis_value(gp_id, gp_axislh) < -axis_threshold || gamepad_button_check(gp_id, gp_padl);
    up = gamepad_button_check_pressed(gp_id, gp_face1);
    up_release = gamepad_button_check_released(gp_id, gp_face1);
    down = gamepad_axis_value(gp_id, gp_axislv) > axis_threshold || gamepad_button_check(gp_id, gp_padd);
    start = gamepad_button_check(gp_id, gp_start);
}
