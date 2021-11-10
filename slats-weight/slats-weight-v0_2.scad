w_x = 90.5;
w_y = 6.7;
s_wall = 1.2;
h_wall = 5; //50;
s_gap = 0.8;

module ellipse(w_x, w_y) {
    resize([w_x, w_y])
        circle(d = w_x);
}

module arc(w_x, w_y, s_wall) {
    difference() {
        ellipse(w_x, w_y);
        translate([0, -s_wall, 0])
            ellipse(w_x, w_y);
    }
}

module arc_height(w_x, w_y, s_wall, h_wall) {
    linear_extrude(height = h_wall) 
        arc(w_x, w_y, s_wall);
}

difference() {
    union() {
        arc_height(w_x, w_y, s_wall, h_wall);

        translate([0, -s_wall, 0])
            arc_height(w_x, w_y, s_wall, 2.4);

        translate([0, -s_wall - s_gap, 0])
            arc_height(w_x, w_y, s_wall, h_wall);
    }
    
    translate([w_x / 2 - 1, -w_y / 2, -1])
        cube([2, 2 * s_wall + s_gap + 2, h_wall + 2]);
    
    translate([-w_x / 2 - 1, -w_y / 2, -1])
        cube([2, 2 * s_wall + s_gap + 2, h_wall + 2]);    
}