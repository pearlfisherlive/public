//Radius = 63.3
//Gap between cables = 4.5
//Distance to middle = 34.6
//Width of cables = 22
// Top of cables = 10.5
//Depth of cavity = 19
$fs=0.01;
module cable1(){
    sec1_len = 15.4;
    translate([0,0 , -14.3]){cylinder(14.3,5.1,5.1);};
    translate([0,-5.1,-14.3]){cube([15,10.2,14.3]);};
    translate([0,0 , -14.3-10.9]){cylinder(10.9, 3.1, 5.1);};
    translate([0,-5.1,-14.3]){
        rotate([0,90,0]){
            linear_extrude(height = 15, center = false, convexity = 10, twist = 0) {
                polygon(points=[[0,0],[10.9,2],[10.9,8.2],[0,10.2]]);
            };
        };
    };
    translate([0,0 ,-14.3-10.9-20]){cylinder(20, 2.2, 2.2);};
    translate([0,-2.2,-14.3-10.9-19.9]){cube([15,4.4,20]);};
};
module cable2(){
    sec1_len = 15.4;
    translate([0,0 , -15.4]){cylinder(15.4,4.5,4.5);};
    translate([0,-4.5,-15.4]){cube([15,9,15.4]);};
    translate([0,0 , -15.4-13.1]){cylinder(13.1, 3.1, 4.5);};
    translate([0,-4.5,-15.4]){
        rotate([0,90,0]){
            linear_extrude(height = 15, center = false, convexity = 10, twist = 0) {
                polygon(points=[[0,0],[13.1,1.4],[13.1,7.6],[0,9]]);
            };
        };
    };
    translate([0,0 , -15.4-13.1-20]){cylinder(20, 2.2, 2.2);};
    translate([0,-2.2,-15.4-13.1-19.9]){cube([15,4.4,20]);};
};
difference(){
    cylinder(19, 31.9, 30.65);
    translate([-50,2.95,0]){cube([100,100,100]);};
    translate([-6.75,2.95,8]){
        rotate([0,270, 270]){
            cable2();
        };
    };
    translate([6.3,2.95,8]){
        rotate([0,270, 270]){
            cable1();
        };
    };
    translate([-6, -37, 9]){
        cube([12, 10, 18]);
    };
};
translate([0,2.95,8]){

    rotate([0,270, 270]){
        //cable2();
    };
}

