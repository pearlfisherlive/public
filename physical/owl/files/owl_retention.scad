//Radius = 63.3
//Gap between cables = 4.5
//Distance to middle = 34.6
//Width of cables = 22
// Top of cables = 10.5
//Depth of cavity = 19
$fs=0.01;
module cable1(){
    sec1_len = 15.4;
    translate([0,0 , 15.4+13.1]){cylinder(15.4,4.5,4.5);};
    translate([0,0 , 15.4]){cylinder(13.1, 3.1, 4.5);};
    {cylinder(20, 2.2, 2.2);};
};
difference(){
    //cylinder(19, 31.65, 30.65);
    //translate([-50,2.95,0]){cube([100,100,100]);};
};
rotate([0,90,90]){
cable1();
};