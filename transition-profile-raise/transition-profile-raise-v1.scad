$fn = $preview ? 16 : 64;

// height of profile
height = 14;

angle = 30;

width_1 = 10;

width_2 = 20;
// width of walls
width_wall = 1.4;
// length of profile
length = 20;

module __hidden__ () {}

width_0 = height / tan(angle);
width_0_1 = width_0 + width_1;
width_0_2 = width_0_1 + width_2;

eps = 0.1;
eps2 = 0.2;

points = [
     [0,0]              // 0
    ,[width_0,0]        // 1
    ,[width_0_1,0]      // 2
    ,[width_0_2,0]      // 3
    ,[width_0_2,height] // 4
    ,[width_0_1,height] // 5
    ,[width_0,height]   // 6
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

linear_extrude(length)
    profile_base();