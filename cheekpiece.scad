$fn = 100;  // degree of rendering detail

widthTopCheek = 163; // y
widthBottomCheek = 114; // y
heightCheek = 30; // z
depthTopCheek = 36; // x
depthBottomCheek = 48; // x
boltSocketDepth = 13.5;
boltSocketDiameter = 9.5;
diameterRod = 12; // roundings
radiusRod = 6;
rightangle = 90;

module basicBlock(widthTop, widthBottom, height, depthTop, depthBottom, boldSocketDepth, boldSocketDiameter, radius) {
    hull() {    // main block from which everything will be cut off/out
        translate([0, 0, height]) rotate([rightangle, 0, 0]) cylinder(widthTop, d = radius * 2);   // rounded corner (for the cheek)
        translate([-12, -((widthTop - widthBottom) / 2), 0]) rotate([rightangle, 0, 0]) cylinder(widthBottom, d = radius * 2);
        translate([depthTop, -((widthTop - widthBottom) / 2), 0]) rotate([rightangle, 0, 0]) cylinder(widthBottom, d = radius * 2);
        translate([depthTop, 0, height]) rotate([rightangle, 0, 0]) cylinder(widthTop, d = radius * 2);
    }
}

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
