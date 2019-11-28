$fs = 0.01;
scale(0.55){
difference(){
    union() {
        cylinder(01.8, 13, 13);    
        translate([-24, -6, 0]){cube([48,12,1.8]);};
    };
    cylinder(1.8, 4, 4);
};
//translate([18, -30, 4]){rotate([0, 90, 90]){cylinder(60, 4, 4);};};
//translate([-18, -30, 4]){rotate([0, 90, 90]){cylinder(60, 4, 4);};};
mirror([1,0,0]) {
    translate([24,-6,0]){cube([1.8,12,7.2]);};
    difference(){
        translate([18.64, -6, 7.2]){rotate([0, 90, 90]){cylinder(12, 7.2, 7.2 );};};
        translate([18.64, -6, 6.6]){rotate([0, 90, 90]){cylinder(12, 5.4, 5.4 );};};
        translate([11,-6,0]){cube([13,12,7.2]);};
    };
};
translate([24,-6,0]){cube([1.8,12,7.2]);};
difference(){
    translate([18.64, -6, 7.2]){rotate([0, 90, 90]){cylinder(12, 7.2, 7.2 );};};
    translate([18.64, -6, 6.6]){rotate([0, 90, 90]){cylinder(12, 5.4, 5.4 );};};
    translate([11,-6,0]){cube([13,12,7.2]);};
};
};