$fn = $preview ? 16 : 64;


difference() {
    union() {
        linear_extrude(6.2)
            difference() {
                circle(d = 62);
                circle(d = 59.6);
            }   

        linear_extrude(1.8)
            circle(d = 63.7);
    }        
    translate([0, 20, 0])
        cube([16, 12.7, 4], center = true);
    
    translate([0, -10, 0])
        cube([27.4, 27.2, 4], center = true);    
    
    translate([0, 10, 0])
        cube([27, 1, 4], center = true);    
    
    translate([0, 8, 0])
        cube([27, 1, 4], center = true);        
}