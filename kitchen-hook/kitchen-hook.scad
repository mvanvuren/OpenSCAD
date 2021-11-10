use <MCAD/boxes.scad>;

$fn = 100;

x = 30;
y = 60;
z = 6;
r = 2;
eps = 0.1;

hr = 5;

difference() {
    union() {
        roundedCube([x, y, 2 * z], r, false, true);

        translate([0, y / 2 - 3 * hr, 2 * hr])
        rotate([0,  -90, 0])
        union() {
            rotate_extrude(angle = 180, convexity = 10)
                translate([2 * hr, 0, 0])
                    circle(r = hr);

            translate([2 * hr, 0, 0])
                sphere(hr);
            
            
        }
    }
    translate([0, 0, -z/2])
        cube([x+eps, y+eps, z+eps], center = true);
}
