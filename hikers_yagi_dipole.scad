$fn = 100;

thi = 1.6;    // arm thickness
dia = 18;     // pipe diameter
hei = 9;      // plastic height over boom
eob = 3.5;    // element-over-boom placement
gap = 12;     // gap between arms
length = 14;  // total length
el_dia = 3;

e=0.05;

bncpl_hei = 19; // bnc plate height
bncpl_thi = 2;  // bnc plate thickness

// dipole arms holder block
dh_width = 45;
dh_hei = 7;
dh_len = 9;

dipole_offset = 2.5;

difference() {
    union() {
        // main arms
        cylinder(d=dia+2*thi, h=length, center=true);
        
        // top block
        translate([hei,0,0])
        cube([2*hei,dia+2*thi,length], center=true);
        translate([hei+eob+dh_hei/4,0,dipole_offset])
        difference() {
            cube([dh_hei,dh_width,dh_len], center=true);
            rotate([90,0,0])
            cylinder(d=el_dia,h=100, center=true);
        }
        
        // BNC plate
        color("red")
        translate([bncpl_hei/2+dia/2+hei,0,-length/2+bncpl_thi/2])
        difference() {
            cube([bncpl_hei+e,dia+2*thi,bncpl_thi],center=true);
            cylinder(d=9.8, h=bncpl_thi+e, center=true);
        }
    }
    
    // hole for clamps
    translate([hei+eob+dh_hei/4,0,dipole_offset])
    cube([8,30,5], center=true);
    
    // hole for pipe
    cylinder(d=dia, h=length+2*e, center=true);
    
    // gap between arms
    translate([-hei,0,0])
    cube([2*hei,gap,length+2*e], center=true);
    
}
