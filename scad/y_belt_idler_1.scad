// eLKa1
// y_belt_idler
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;
use <modules.scad>;

module y_belt_idler_1(){
  largeur=20; //20
  $fn=32;
  echo ("y_belt_idler");
  echo ("├ écrou M4");
  echo (str("└ vis FS M4 x ", (ybi_ec+ybi_ep2*2)+1));
    
  color (couleur){
    difference(){
      union(){
        // Base
        translate([-largeur/2,-(ybi_ec+ybi_ep2*2)/2-0.5-0.5,0]) cube([largeur, (ybi_ec+ybi_ep2*2)+1+1, ybi_ep1]);
        // Coté trou simple
        translate([0,(ybi_ec+ybi_ep2*2)/2+0.5+0.5,ybi_h]) rotate([-90,0,0]) cylinder(d=largeur,h=ybi_ep1);
        translate([-largeur/2,(ybi_ec+ybi_ep2*2)/2+0.5+0.5,0]) cube([largeur,ybi_ep1,ybi_h]);
        // Coté écrou
        translate([0,-(ybi_ec+ybi_ep2*2)/2-0.5-0.5,ybi_h]) rotate([90,0,0]) cylinder(d=largeur,h=ybi_ep1+ybi_ecrouh);
        translate([-largeur/2,-(ybi_ec+ybi_ep2*2)/2-ybi_ep1-ybi_ecrouh-0.5-0.5,0]) cube([largeur,ybi_ep1+ybi_ecrouh,ybi_h]);  
      }
      // Vis fixation
      translate([0,0,-1]) cylinder(d=vis5,h=ybi_ep1+2);
      translate([0,0,ybi_ep1-2]) cylinder(d1=vis5, d2=vis5+6, h=3);
      // Vis axe
      translate([0,0,ybi_h]) rotate([90,0,0]) cylinder(d=ybi_vis, h=(ybi_ec+ybi_ep2*2)+2*ybi_ep1+2*ybi_ecrouh+2, center=true);
      translate([0,-(ybi_ec+ybi_ep2*2)/2-ybi_ep1-ybi_ecrouh+2-0.5,ybi_h]) rotate([90,0,0]) cylinder(d1=ybi_vis, d2=ybi_vis+6, h=3);
      // Écrou
      translate([0,-(ybi_ec+ybi_ep2*2)/2+1-0.5,ybi_h]) rotate([90,0,0]) ecrou(ybi_ecrou,ybi_ecrouh+1);
    }

    /*difference(){
      // Renfort
      copy_mirror([1,0,0]) translate([-largeur/2,-(ybi_ec+ybi_ep2*2)/2]) cube([3,(ybi_ec+ybi_ep2*2),ybi_h-2]);
      translate([0,0,ybi_h]) rotate([90,0,0]) cylinder(d=largeur-1, h=(ybi_ec+ybi_ep2*2)+2, center=true);
      
    }*/
  }
}

y_belt_idler_1();