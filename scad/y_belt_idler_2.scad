// eLKa1
// y_belt_idler_2
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;
use <modules.scad>;

module y_belt_idler_2(){
  $fn=32;
  echo ("y_belt_idler_2");
  echo ("├ écrou M4");
  echo (str("└ vis FS M4 x ", (ybi_ec+2*ybi_ep2)+4));
  
  color (couleur) rotate([90,0,0]) {
    //cylinder(d=largeur, h=ecart);
    //translate([])
    difference(){
      union(){
        hull(){
          translate([-ybi_long/2-10,-ybi_prof/2,-(ybi_ec+2*ybi_ep2)/2-0.5]) cube([1,ybi_prof,ybi_ec+2*ybi_ep2+1]);
          translate([ybi_long/2,0,0]) cylinder(d=ybi_prof, h=ybi_ec+2*ybi_ep2, center=true);
        }
        // demi cylindre
        translate([-ybi_long/2,ybi_prof/2-7,0]) 
        intersection(){
          cylinder(d=20, h=ybi_ec+2*ybi_ep2+1, center=true);
          translate([-10,0,-ybi_ec/2-ybi_ep2-0.5]) cube([20,20,ybi_ec+2*ybi_ep2+1]);
        }
        
      }
      // trou roulement
      difference(){
        hull(){
          cylinder(h=ybi_ec, d=18, center=true);
          translate([0,ybi_prof,0]) cylinder(h=ybi_ec+1, d=18, center=true);
        }
        // Rondelle hauteur 0.5
        copy_mirror([0,0,1]) translate([0,0,ybi_ec/2]) cylinder(h=0.5,d=vis4+2);
      }
      cylinder(d=vis4, h=ybi_ec+2*ybi_ep2+2, center=true);
      rotate([180,0,0]) translate([0,0,-ybi_ec/2-ybi_ep2-1.5]) cylinder(d1=vis4+8, d2=vis4, h=4);
      // axe
      translate([ybi_long/2,0,0]) cylinder(d=vis4, h=ybi_ec+2*ybi_ep2+2, center=true);
      // serrage
      hull(){
        rotate([90,0,0]) translate([-ybi_long/2+10-2.5-ybi_ep2,0,0]) cylinder(d=vis4, h=ybi_prof+10+2, center=true);
        rotate([90,0,0]) translate([-ybi_long/2-10+2.5+ybi_ep2,0,0]) cylinder(d=vis4, h=ybi_prof+10+2, center=true);
      }
    }
    
  }
}

y_belt_idler_2();