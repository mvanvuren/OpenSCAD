$fn = $preview ? 16 : 64;

// length of blade
length = 182;
// height of sheath
height = 21;
// width of blade
width = 1.6;
// width of wall
wall = 2.4;

module __hidden__ () {}

eps = 0.1;

difference() {
    cube([length, width + 2 * wall, height + wall]);
    translate([-eps, wall, wall])
        cube([length + 2 * eps, width, height + eps]);
}
