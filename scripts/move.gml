///move(collision_object)

var collision_object = argument0;

// Horizontal collisions
if (place_meeting(x + hspd, y, collision_object)) {
    for (; hspd != 0; hspd -= sign(hspd)) {
        if !place_meeting(x + hspd, y, collision_object) {
            break;
        }
    }
}

x += hspd;

// Vertical collisions
if (place_meeting(x, y + vspd, collision_object)) {
    for (; vspd != 0; vspd -= sign(vspd)) {
        if !place_meeting(x, y + vspd, collision_object) {
            break;
        }
    }
}

y += vspd;
