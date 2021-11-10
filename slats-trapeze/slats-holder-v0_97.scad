include <BOSL/constants.scad>
use <BOSL/transforms.scad>

$fa=0.5;
$fs=0.5;

degrees = 43; // degree of rail (Note: 43 degrees was printed by me)
r_cup = 9; // outer radius of cup (ball holder). kept small so slats don't touch cup
s_cup_wall = 1.2; // thickness of wall cup
s_ball_space = 0.15; // some space between cup and ball to reduce friction
r_cup_hole = 5; // radius of hole in cup (opening for slat holder)
s_x_cup = 32; // length of cup
s_y_cup = 36; // width of cup
s_z_cup = 1.6; // thickness of cup plate
s_x_cup_spacer = 51; // length of spacer between two cups (avoids cups sliding down on eachother)
s_rail = 4; // size of the rail in which the cup hangs

d_cup = 2 * r_cup; // diameter cup (ball holder)
r_ball = r_cup - s_cup_wall - s_ball_space; // radius of ball
d_ball = 2 * r_ball; // diameter of ball
r_cup_inner = r_cup - s_cup_wall; // inner radius of cup (ball holder)

s_x_blocker = s_z_cup; // length of blocker
s_y_blocker = s_y_cup - 2 * s_rail; // reduce widht of blocker width size of rail (in which the cup hangs)
s_z_blocker = 2 * s_z_cup; // thickness of blocker

s_hanger = r_ball - 4.3; // hole in ball needed to attach hanger to
d_hanger = 8.1; // diameter of hanger

module blocker(s_x_cup) {
    move([-s_x_cup / 2, -s_y_blocker / 2, - 0.01])
        cube([s_x_blocker, s_y_blocker, s_z_blocker]);
}

module cup() {   
    difference() {
        union() {
            yrot(-degrees) {
                union() {
                    difference() {
                        union() {
                            bottom_half() sphere(r_cup);
                            down(s_z_cup / 2) cube([s_x_cup, s_y_cup, s_z_cup], true);
                        }
                        sphere(r_cup_inner);                         
                    } // difference
                    blocker(s_x_cup);
                    xflip() blocker(s_x_cup);
                } // union
            } // rotate    
            bottom_cup = sqrt(pow(r_cup, 2) - pow(r_cup_hole, 2));
            bottom_plate = s_x_cup / 2 * sin(degrees) + (sin(90 - degrees) * s_z_cup);
            down(bottom_plate)
                cylinder(h = bottom_plate - bottom_cup + s_cup_wall, r = r_cup_hole + s_cup_wall);
        } // union
        zflip() cylinder(h = s_x_cup / 2 + 0.01, r = r_cup_hole);
    } // difference
}

module spacer() {    
    up(s_z_cup) {
        down(s_z_cup / 2) cube([s_x_cup_spacer, s_y_cup, s_z_cup], true);
        blocker(s_x_cup_spacer);
        xflip() blocker(s_x_cup_spacer);
    }
}

module ball() {
    difference() {        
        top_half() sphere(r_ball);
        up(s_hanger) cylinder(h = r_ball, d = d_hanger);
    }
}

cup();
//ball();
//spacer();

// module sanding_ball() {
//     top_half() sphere(r_ball - 1.6);
//     down(20 + 0.1) cylinder(h = 20, r = 3);
// }
// sanding_ball();

module sanding_cup() {
    difference() {
        top_half() sphere(r_cup + 1.6);
        sphere(r_cup_inner + 0.8);
    }    
    up(r_cup - 0.1) cylinder(h = 20, r = 3);
}
//sanding_cup();