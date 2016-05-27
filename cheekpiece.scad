$fn = 100;

widthTopCheek = 163; // y
widthBottomCheek = 114; // y
heightCheek = 30; // z
depthTopCheek = 36; // x
depthBottomCheek = 48; // x
boltSocketDepth = 13.5;
boltSocketDiameter = 9.5;
diameterRod = 12; // Halterungsstangen + Rundungen
radiusRod = 6;

rotate([0, 180, 0]) {   // preparing for printing (better this way)
    difference() {
        hull() {    // main block from which everything will be cut off/out
            translate([0, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);   // rounded corner (for the cheek)
            translate([-12, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
            translate([36, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
            translate([36, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
        }
        translate([2, 0, -17]) hull() {
            translate([0, 1, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek + 2, d = diameterRod);
            translate([-12, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
            translate([36, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
            translate([46, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
        }
        translate([6.4, widthTopCheek - 30, -6]) hull() {
            translate([0, 1, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek + 2, d = diameterRod);
            translate([-12, 0, 0]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
            translate([36, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
            translate([46, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
        }
        translate([6.4, -widthTopCheek + 30, -6]) hull() {
            translate([0, 1, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek + 2, d = diameterRod);
            translate([-12, 0, 0]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
            translate([36, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
            translate([46, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
        }
        translate([20, -46, 18.9]) cylinder(boltSocketDepth, d = boltSocketDiameter);
        translate([20, -102.5, 18.9]) cylinder(boltSocketDepth, d = boltSocketDiameter);
        translate([depthTopCheek,-(widthTopCheek + 1),15]) cube([10, widthTopCheek + 2, 30]);
        translate([-30,-(widthTopCheek + 1),0]) rotate([0, 90, 0]) cube([10, widthTopCheek + 2, 30]);
        translate([-20,-widthTopCheek, heightCheek + radiusRod]) rotate([127,0,0]) mirror([0,1,0]) cube([depthTopCheek * 1.8, heightCheek * 1.6, 10]);
        translate([-20,0, heightCheek + radiusRod]) rotate([-127,0,0]) cube([depthTopCheek * 1.8, heightCheek * 1.6, 10]);
    }
}

height = 74;  // z
width = 156;  // y
depth = 25.3; // x

//difference() {
//    difference() {
//        cube([depth, width, height]);
//        translate([(radiusRod + 11), (60 + radiusRod), -5]) cylinder(80, d = diameterRod);
//        translate([(radiusRod + 11), (89 + radiusRod), -5]) cylinder(80, d = diameterRod);
//    }
//
//    translate([0, 28, 30]) union(){
//        hull(){
//            translate([-3, 0, 0]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//            translate([-3, 80, 0]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//            translate([-3, -15, 23]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//            translate([-3, 105, 39]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//        }
//        hull(){
//            translate([-3, -12, 23]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//            translate([-3, -30, 23]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//            translate([-3, -30, 60]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//        }
//        hull(){
//            translate([-3, 102, 39]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//            translate([-3, 120, 39]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//            translate([-3, 128, 52]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//        }
//        hull(){
//            translate([-3, -12, 23]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//            translate([-3, -20, 43]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//            translate([-3, 122, 52]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//            translate([-3, 102, 39]) rotate([0, 90, 0]) cylinder(depth + 5, d = 6);
//        }
//    }
//}
