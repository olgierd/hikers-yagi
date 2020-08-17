$fn = 100;

thi = 1.6;    // arm thickness
dia = 18;     // pipe diameter
hei = 9;      // plastic height over boom
eob = 3.5;    // element-over-boom placement
gap = 12;     // gap between arms
length = 10;  // total length

e=0.05;

difference() {
    union() {
        // main arms
        cylinder(d=dia+2*thi, h=length, center=true);
        
        // top block
        translate([hei,0,0])
        cube([2*hei,dia+2*thi,length], center=true);
    }
    
    // hole for pipe
    cylinder(d=dia, h=length+2*e, center=true);

    // hole for element
    rotate([90,0,0])
    translate([dia/2+thi+eob,0,0])
    cylinder(d=3,h=dia+2*thi+2*e, center=true);
    
    // top hole
    rotate([0,90,0])
    translate([0,0,dia+hei])
    cylinder(d=6,h=dia*2+hei*2, center=true);
    
    // gap between arms
    translate([-hei,0,0])
    cube([2*hei,gap,length+2*e], center=true);
    
}
    