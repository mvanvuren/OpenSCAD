//$fn=100;
//$fa=1;
//$fs=1.5;
$fa=0.5;
$fs=0.5;

//linear_extrude(height = 1.2) 
//    difference() {
//        union() {
//            
//            translate([-13.5, 0, 0])
//                square([27, 9]);
//            
//            resize([12, 8])
//                circle(d = 8);        
//        }
//
//        resize([10, 6])
//            circle(d = 6);   
//    };

radius = 11;
wall = 1.2;
ball = radius - wall;
ball_space = 0.1; //TODO: increase
ball_spaced = ball - ball_space;
hole = 10;
y_edge = 7;
y_size = 2 * radius + 2 * y_edge;
x_edge = 5;
x_size = 2 * radius + 2 * x_edge;
x_size_spacer = 51.5;
z_edge = 1.6;
degrees = 43; //43;
x_blocker_size = 2 * z_edge;
y_blocker_size = 2 * radius;
z_blocker_size = 2 * z_edge;

module holder() {
    // infill density: 100%    
    difference() {
        rotate(-degrees, [0,1,0]) {
            
            difference() {
                union() {
                    sphere(radius);
                    cube([x_size, y_size, z_edge], true);
                }
                // TODO: correct friction for already printed balls
                sphere(ball + 0.15); 
                
                translate([0, 0, (radius + z_edge) / 2])
                    cube([x_size, y_size, radius], true);          
            }        
        }
     
        cylinder(h = 2 * radius, d = hole, center = true);
        
        translate([-0.5 * x_size, -0.5 * (y_size + 2), 10.3]) // TODO: 10.3
            #cube([x_size, y_size + 2, radius]);        
        
        translate([-0.5 * x_size, -0.5 * (y_size + 2), -2 * radius + 1.22]) // TODO: 1.22
            #cube([x_size, y_size + 2, radius]);
    }
}


module spacer() {
    
    opp = z_edge;
    hyp = opp / sin(degrees);
    adj = hyp * cos(degrees);

    difference() {
        union() {
            cube([x_size_spacer, y_size, z_edge], true);
            
            translate([-0.5 * x_size_spacer + adj, -y_blocker_size / 2, opp / 2])
                cube([x_blocker_size, y_blocker_size, z_blocker_size]);
            
            translate([0.5 * x_size_spacer - 2 * adj, -y_blocker_size / 2, opp / 2])
                cube([x_blocker_size, y_blocker_size, z_blocker_size]);            
        }        
        
        translate([0.5 * (-x_size_spacer + adj), 0, 0])
            rotate(-degrees, [0, 1, 0])
                translate([0, 0, hyp / 2]) // TODO: z
                    cube([hyp, y_size + 2, hyp], true);            
        
        translate([0.5 * (x_size_spacer - adj), 0, 0]) // TODO: z
            rotate(-degrees, [0, 1, 0])
                translate([0, 0, -hyp / 2]) // TODO: z
                    cube([hyp, y_size + 2, hyp], true);        
    }
}

module ball() {
    // infill density: 10%
    difference() {
        sphere(ball_spaced);
        translate([0, 0, ball_spaced - 3.85])
            cylinder(h = radius, d = 8.1);
        translate([-radius, -radius, -radius])
        cube([2 * radius, 2 * radius, radius]);
    }
}

holder();
//spacer();
//ball();

//cube([x_blocker_size, y_blocker_size, z_blocker_size]);