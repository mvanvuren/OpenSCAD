$fn = $preview ? 16 : 64;

// length of profile
length = 10;
// height of profile
height = 15;
width_1 = 10;
width_2 = 20;
// width of walls
width_wall = 1.4;

module __hidden__ () {}

eps = 0.1;
eps2 = 0.2;

points = [
     [0,0]
    ,[width_2,0]
    ,[0,height]
];

module profile_base() {
    difference() {
        polygon(points);
        
        translate([width_0_1 + width_wall, -width_wall])
            square([width_2, height]);
        
        translate([width_0 + width_wall, -width_wall])
            square([width_1 - width_wall, height / 2 ]);    
        
        translate([width_0 + width_1 / 2 + width_wall / 2, height / 2])
            circle(d = width_1 - width_wall);
            //square([width_1 - width_wall, height / 2 ]);            
    }
}

linear_extrude(length) {

    translate([width_1 + width_2 + 2, 0, 0])
        polygon(points);

    difference() {
        square([width_1 + width_2, height]);
        
        translate([width_wall, height / 2, 0])
            square([width_1,  height / 2 + eps2]);
        
        translate([width_wall + width_1 / 2, height / 2, 0])
            circle(d = width_1);
       
        translate([width_1 + 2 * width_wall, width_wall, 0])
            square([width_2, height]);
    }    
}