/*
Code in this file is the intellectual property of Brian McEvoy
http://www.24hourengineer.com/
*/

dowelDiameter = (1 + 3/8) * 25.4;
dowelSlop = 0.5;
collarThickness = 12;
collarWidth = 14;
zipTieVoid = 6;
centerDividerDepth = 5;

dowelRadius = dowelDiameter/2 + dowelSlop/2;
outerRadius = dowelRadius + collarThickness;
echo("Dowel Diameter in millimeters: ", dowelRadius*2);

$fn = 120;

collarBit = 1;
centerDrawBit = 1;

if(collarBit){
    difference(){
        cylinder(collarWidth, outerRadius, outerRadius, center = true);
        cylinder(collarWidth*2, dowelRadius, dowelRadius, center = true);
        translate([zipTieVoid/2,0,-collarWidth/2 + zipTieVoid/8 - 0.01]){
            cube([dowelRadius*2 + 0, zipTieVoid, zipTieVoid], center = true);
        }
    }
}


if(centerDrawBit){
    difference(){
        translate([0,0,-centerDividerDepth]){
            cylinder(collarWidth, outerRadius, outerRadius, center = true);
        }
        centerDividerThickness = (dowelRadius + outerRadius)/2;
        cylinder(collarWidth*2, centerDividerThickness, centerDividerThickness, center = true);
        translate([-outerRadius*1,0,0]){
            cube([outerRadius*2, outerRadius*2, outerRadius*2], center = true);
        }
    }
}