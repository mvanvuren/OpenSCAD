$fn = $preview ? 16 : 64;

// diameter of cable (plus slack)
cable_diameter = 3;
// distance between cable and top of profile
fill = 0.8;
// width of transition profile
width = 23;
// length of transition profile
length = 200;

module __hidden__ () {}

height = cable_diameter + fill;

eps = 0.1;
eps2 = 0.2;

rotate([-90, 0, 0])
rotate([0, 90, 0])
difference() {
    linear_extrude(length, center = true)
        scale([width / 2, height, 1])
            circle(r = 1);
    translate([-0.5 * width - eps, 0, -0.5 * length - eps])
        cube([width + eps2, height, length + eps2]);
    
    union() {
        translate([0, -0.5 * cable_diameter, 0])
            cylinder(length + eps2, d = cable_diameter, center = true);
        cube([cable_diameter, cable_diameter, length + eps2], center =true);
    }
}