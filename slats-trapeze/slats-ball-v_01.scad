$fa=0.5;
$fs=0.5;

radius = 11;
wall = 1.2;
ball = radius - wall;
ball_space = 0.1;
ball_spaced = ball - ball_space;

module stl() {
    import("C:/Users/mvanvuren/3D Objects/_todo/Bodacious_Allis_5.stl");
}

module ball() {
    // infill density: 10%
    difference() {
        sphere(ball_spaced);
        translate([-radius, 0, -radius])
            cube([2 * radius, 2 * radius, 2 * radius]);
    }
}

rotate(90, [-1, 0, 0]) {
    translate([4, 13,3.5])
        ball();
    stl();
}