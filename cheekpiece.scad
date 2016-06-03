$fn = 100;  // degree of rendering detail

rightangle = 90;

rotate([0, 2 * rightangle, 0]) {   // rotate for better printing
    cheekpiece(163, 114, 30, 36, 6, 13, 9.5);
}

/*
 * This is the basic block shape/object from which the
 * cheek piece will be carved out with boolean operations.
 *
 * @param widthTop Length of the whole cheek piece (y-axis).
 * @param widthBottom Length of the bottom part (shorter -> slanted angle).
 * @param height Height of the cheek piece (z-axis).
 * @param depthTop Depth/Width of the cheek piece (x-axis).
 * @param radius Roundness of the cheek's resting place.
 */
module basicBlock(widthTop, widthBottom, height, depthTop, radius) {
    hull() {
        // top rounded corner for the cheek
        translate([0, 0, height])
            rotate([rightangle, 0, 0])
                cylinder(widthTop, d = radius * 2);
        // bottom of the slanted side
        // TODO replace the magic number 12 (for the slanted angle of the piece)
        translate([-8, -((widthTop - widthBottom) / 2), 0])
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

/*
 * The complete, parameterized cheek piece.
 *
 * @param widthTop Length of the whole cheek piece (y-axis).
 * @param widthBottom Length of the bottom part (shorter -> slanted angle).
 * @param height Height of the cheek piece (z-axis).
 * @param depthTop Depth/Width of the cheek piece (x-axis).
 * @param radius Roundness of the cheek's resting place
 * @param boltSocketDepth Depth of the bolt socket.
 * @param boltSocketDiameter Diameter of the bolt socket.
 */
module cheekpiece(widthTop, widthBottom, height, depthTop, radius, boltSocketDepth, boltSocketDiameter) {
    thicknessTopMiddle = 17;
    thicknessTopSides = 6;
    socketDistance = 56.5;
    sideAngle = (rightangle * 2) - atan(height / ((widthTop - widthBottom) / 2));

    difference() {
        // base block from which everything will be cut off
        basicBlock(widthTop, widthBottom, height, depthTop, radius);
        // middle part
        translate([2, 0, -thicknessTopMiddle])
            basicBlock(widthTop, widthBottom, height, depthTop + radius, radius);
        // back
        // TODO replace magic numbers (6.4 -> depends on the angle (see number 12 from above))
        translate([4.94, widthTop - 30, -thicknessTopSides])
            basicBlock(widthTop + 2, widthTop + 2, height, depthTop + radius, radius);
        // front
        translate([4.94, -widthTop + 30, -thicknessTopSides])
            basicBlock(widthTop + 2, widthTop + 2, height, depthTop + radius, radius);
        // 1st socket
        translate([20, -46, (height + radius) - thicknessTopMiddle - 0.1])
            cylinder(boltSocketDepth, d = boltSocketDiameter);
        // 2nd socket
        translate([20, -(46 + socketDistance), (height + radius) - thicknessTopMiddle - 0.1])
            cylinder(boltSocketDepth, d = boltSocketDiameter);

        // cut off the sides for a cleaner look
        // side (left)
        translate([depthTop, -(widthTop + 1), radius * 1.5])
            cube([radius * 2, widthTop + 2, height]);
        // top
        translate([-depthTop, -(widthTop + 1),0])
            rotate([0, rightangle, 0])
                cube([radius * 2, widthTop + 2, height]);
        // front
        translate([-20, -widthTop, height + radius])
            rotate([sideAngle, 0, 0])
                mirror([0, 1, 0])
                    cube([depthTop * 1.8, height * 1.6, 10]);
        // back
        translate([-20, 0, height + radius])
            rotate([-sideAngle, 0, 0])
                cube([depthTop * 1.8, height * 1.6, 10]);
    }

    translate([0, 5, 30]) cube([depthTop, 5, radius]);
    translate([0, -173, 30]) cube([depthTop, 5, radius]);
}


//widthTopCheek = 163;      // y
//widthBottomCheek = 114;   // y
//heightCheek = 30;         // z
//depthTopCheek = 36;       // x
//depthBottomCheek = 48;    // x
//boltSocketDepth = 11.5;
//boltSocketDiameter = 9.5;
//diameterRod = 12;         // roundings
//radiusRod = 6;
//
//rotate([0, 180, 0]) {   // preparing for printing (better this way)
//    difference() {
//        hull() {    // main block from which everything will be cut off/out
//            translate([0, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);   // rounded corner (for the cheek)
//            translate([-8, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
//            translate([36, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
//            translate([36, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
//        }
//        translate([2, 0, -17]) hull() {
//            translate([0, 1, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek + 2, d = diameterRod);
//            translate([-8, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
//            translate([36, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
//            translate([46, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
//        }
//        translate([4.94, widthTopCheek - 30, -6]) hull() {
//            translate([0, 1, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek + 2, d = diameterRod);
//            translate([-8, 0, 0]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
//            translate([36, -((widthTopCheek - widthBottomCheek) / 2), 0]) rotate([90, 0, 0]) cylinder(widthBottomCheek, d = diameterRod);
//            translate([46, 0, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
//        }
//        translate([4.94, -widthTopCheek + 30, -6]) hull() {
//            translate([0, 1, heightCheek]) rotate([90, 0, 0]) cylinder(widthTopCheek + 2, d = diameterRod);
//            translate([-8, 0, 0]) rotate([90, 0, 0]) cylinder(widthTopCheek, d = diameterRod);
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
