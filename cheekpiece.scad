$fn = 100;  // degree of rendering detail

//widthTopCheek = 163;      // y
//widthBottomCheek = 114;   // y
//heightCheek = 30;         // z
//depthTopCheek = 36;       // x
//depthBottomCheek = 48;    // x
//boltSocketDepth = 13.5;
//boltSocketDiameter = 9.5;
//diameterRod = 12;         // roundings
//radiusRod = 6;
rightangle = 90;
socketDistance = 56.5;

rotate([0, 180, 0]) {
    cheekpiece(163, 114, 30, 36, 6, 13, 9.5);
}

module basicBlock(widthTop, widthBottom, height, depthTop, radius) {
    hull() {
        // top rounded corner for the cheek
        translate([0, 0, height])
            rotate([rightangle, 0, 0])
                cylinder(widthTop, d = radius * 2);
        // bottom of the slanted side
        translate([-12, -((widthTop - widthBottom) / 2), 0])
            rotate([rightangle, 0, 0])
                cylinder(widthBottom, d = radius * 2);
        // bottom of the straight side
        translate([depthTop, -((widthTop - widthBottom) / 2), 0])
            rotate([rightangle, 0, 0])
                cylinder(widthBottom, d = radius * 2);
        // the other top corner (away from the face)
        translate([depthTop, 0, height])
            rotate([rightangle, 0, 0])
                cylinder(widthTop, d = radius * 2);
    }
}


module cheekpiece(widthTop, widthBottom, height, depthTop, radius, boltSocketDepth, boltSocketDiameter) {
    difference() {
        // base block from which everything will be cut off
        basicBlock(widthTop, widthBottom, height, depthTop, radius);
        translate([2, 0, -17]) basicBlock(widthTop, widthBottom, height, depthTop + radius, radius);
        translate([6.4, widthTop - 30, -6]) basicBlock(widthTop + 2, widthBottom, height, depthTop + radius, radius);
        translate([6.4, -widthTop + 30, -6]) basicBlock(widthTop + 2, widthBottom, height, depthTop + radius, radius);
        translate([20, -46, (height + radius) - 17 - 0.1]) cylinder(boltSocketDepth, d = boltSocketDiameter);     // 1st socket
        translate([20, -(46 + socketDistance), (height + radius) - 17 - 0.1]) cylinder(boltSocketDepth, d = boltSocketDiameter);  // 2nd socket
    }
}

//rotate([0, 180, 0]) {   // preparing for printing (better this way)
//    difference() {
//        hull() {    // main block from which everything will be cut off/out
//            translate([0, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);   // rounded corner (for the cheek)
//            translate([-12, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
//            translate([36, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
//            translate([36, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
//        }
//        translate([2, 0, -17]) hull() {
//            translate([0, 1, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek + 2, d = diameterRod);
//            translate([-12, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
//            translate([36, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
//            translate([46, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
//        }
//        translate([6.4, widthTopCheek - 30, -6]) hull() {
//            translate([0, 1, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek + 2, d = diameterRod);
//            translate([-12, 0, 0]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
//            translate([36, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
//            translate([46, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
//        }
//        translate([6.4, -widthTopCheek + 30, -6]) hull() {
//            translate([0, 1, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek + 2, d = diameterRod);
//            translate([-12, 0, 0]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
//            translate([36, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
//            translate([46, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
//        }
//        translate([20, -46, 18.9]) cylinder(boltSocketDepth, d = boltSocketDiameter);     // 1st socket
//        translate([20, -102.5, 18.9]) cylinder(boltSocketDepth, d = boltSocketDiameter);  // 2nd socket
//
//        // cut off the sides for a cleaner look
//        translate([depthTopCheek,-(widthTopCheek + 1),15]) cube([10, widthTopCheek + 2, 30]);
//        translate([-30,-(widthTopCheek + 1),0]) rotate([0, 90, 0]) cube([10, widthTopCheek + 2, 30]);
//        translate([-20,-widthTopCheek, heightCheek + radiusRod]) rotate([127,0,0]) mirror([0,1,0]) cube([depthTopCheek * 1.8, heightCheek * 1.6, 10]);
//        translate([-20,0, heightCheek + radiusRod]) rotate([-127,0,0]) cube([depthTopCheek * 1.8, heightCheek * 1.6, 10]);
//    }
//}
