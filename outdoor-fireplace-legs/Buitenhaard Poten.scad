$fa=0.5;
$fs=0.5;

s_x=43;
s_y=39;
s_z=30;
wall=10;

difference() {
    translate([0, 0, -5])
        resize([s_x + wall, s_x + wall, s_z])
            cylinder(h=s_z, d=s_x);
    
    difference() {
        rotate(26, [0, -1, 0])    
            cylinder(h= 3 * s_z, d = s_y, center=true);
     
        translate([0, 0, -2 * wall])
            cube([s_x + 2 * wall, s_y + 2 * wall, 4 * wall], center =true); 
    }
}