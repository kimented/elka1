include <config.scad>;
use <modules.scad>;

module y_belt_idler_1(){
  ep=4;
  hauteur=16; //14
  largeur=25; //20
  ecart=15;
  $fn=32;
  vis=vis4;
  ec=ec4;
  ech=ec4h;
    
  color (couleur){
    difference(){
      union(){
        // Base
        translate([-largeur/2,-ecart/2,0]) cube([largeur, ecart, ep]);
        // Coté trou simple
        translate([0,ecart/2,hauteur]) rotate([-90,0,0]) cylinder(d=largeur,h=ep);
        translate([-largeur/2,ecart/2,0]) cube([largeur,ep,hauteur]);
        // Coté écrou
        translate([0,-ecart/2,hauteur]) rotate([90,0,0]) cylinder(d=largeur,h=ep+ech);
        translate([-largeur/2,-ecart/2-ep-ech,0]) cube([largeur,ep+ech,hauteur]);  
      }
      // Vis fixation
      translate([0,0,-1]) cylinder(d=vis5,h=ep+2);
      translate([0,0,ep-2]) cylinder(d1=vis5, d2=vis5+6, h=3);
      // Vis axe
      translate([0,0,hauteur]) rotate([90,0,0]) cylinder(d=vis, h=ecart+2*ep+2*ech+2, center=true);
      translate([0,-ecart/2-ep-ech+2,hauteur]) rotate([90,0,0]) cylinder(d1=vis, d2=vis+6, h=3);
      translate([0,-ecart/2+1,hauteur]) rotate([90,0,0]) ecrou(ec,ech+1);
    }

    difference(){
      // Renfort
      copy_mirror([1,0,0]) translate([-largeur/2,-ecart/2]) cube([3,ecart,hauteur-2]);
      translate([0,0,hauteur]) rotate([90,0,0]) cylinder(d=largeur-1, h=ecart+2, center=true);
      
    }
  }
}

y_belt_idler_1();