use <MCAD/boxes.scad>

$fn = $preview ? 16 : 64;

wall   = 0.56;
width  = 13.8;
depth  = 13.8;
height = 2.3;
rc     = 1.5;


module pin1() {
    roundedCube([1, 1, height - 0.2], 0.15, true, true);
}

module pin2() {
    roundedCube([0.9, 0.9, height - 0.4], 0.15, true, true);
}

difference() {
    roundedCube([width, depth, height], rc, true, true);    
    
    translate([0, 0, wall])
        roundedCube([width - 2 * wall, depth - 2 * wall, height], rc, true, true);
}

translate([width / 2 - wall - 0.4, width / 2 - 2.6, 0])
    pin1();

translate([-width / 2 + wall + 0.4, width / 2 - 2.6, 0])
    pin1();

translate([-width / 2 + 3, -width / 2 + 2.95, 0])
    pin2();

translate([-width / 2 + 3, -width / 2 + 1.65, 0])
    pin2();

translate([width / 2 - 3, -width / 2 + 2.95, 0])
    pin2();

translate([width / 2 - 3, -width / 2 + 1.65, 0])
    pin2();
