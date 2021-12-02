//https://github.com/reycf/mini-itx-atx/blob/master/screw_holes.scad
include <screw_holes.scad>

$fa=0.5;
$fs=0.5;

shell=1.2;

module thing() {
    hull() {
        cube([30 + 2 * shell, 10 + 3 * shell, 30]);
        
        translate([-30, 0, 0])
            cube([90, 1.2, 30]);
    }    
}

difference() {
    scale([1.4, 1.4, 1]) {
        difference() {
            union () {
                thing();

                hull() {
                    translate([-30, -15 + shell, 30 - 0.1])
                        cube([90, 15, shell]);

                    translate([0, 0, 30 - 0.1])
                        thing();
                }
            }
            
            translate([shell, shell, 10 + shell])
                cube([30, 10, 60]);
        }
    }
    
    translate([1.4 * (-15 - shell), 11.6, 15])
        rotate(a=[90, 0, 0])
            screw_hole([9, 6, 90], M4, 25);

    translate([1.4 * (45 + 2 * shell), 11.6, 15])
        rotate(a=[90, 0, 0])
            screw_hole([9, 6, 90], M4, 25);        
}