use <MCAD/boxes.scad>;

$fn = 32;

xi = 73;
yi = 69;
zi = 32;
wall = 2;
xo = 2 * wall + xi;
yo = 2 * wall + yi;
zo = 2 * wall + zi;
ro = 5;
ri = ro - 2;
xh1 = 30;
zh1 = 14;
zoh1 = wall + 5.2;
rh1 = 7;
xh2 = 46;
yh2 = 35;
yoh1 = wall + 26;
rh2 = 1;

rotate([90, 0, 0])
difference() {
    roundedCube([xo, yo, zo], ro, false, false);
    translate([wall, wall, wall])
        roundedCube([xi, yi + 2 * wall, zi], ri, false, false);    
    translate([xo / 2 - xh1 / 2, -wall, zoh1])
        roundedCube([xh1, 2 * wall, zh1], rh1, false, false);
    translate([xo / 2 - xh2 / 2, yoh1, zi + wall / 2])
        roundedCube([xh2, yh2, 2 * wall], rh2, false, false);    
}    
